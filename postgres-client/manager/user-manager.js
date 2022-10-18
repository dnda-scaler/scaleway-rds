const { Pool } = require('pg')
const config = require('config');
const USER_TABLE="USER_MGT_TABLE";

class UserManager {
    pool=null;
    writeManager;
    constructor(writeManager){
        this.writeManager=writeManager;
    }
    async getClient(writeRider){
        if(!this.pool){
            const dbConfig={
                user: config.get("username"),
                password: config.get("password"),
                host: config.get("db_host"),
                database: config.get("db_name"),               
                port: config.get("db_port")
            }
            //SELECT use read replica if there is one 
            if(!writeRider && config.get("has_read_replica")){
                dbConfig.host=config.get("read_replica_ip");
                dbConfig.port=config.get("read_replica_port");
            }
            this.pool= new Pool(dbConfig);
            if(writeRider){
                await this.initializeDB();
            }
        }
        return this.pool;
    }

    async initializeDB(){
        console.log("Database init start");
        const query=`
            CREATE TABLE IF NOT EXISTS ${USER_TABLE} (
                PK_ID  SERIAL PRIMARY KEY,
                NAME  TEXT      NOT NULL,
                EMAIL TEXT      NOT NULL,
                AGE INT NOT NULL
            )
        `
        await this.pool.query(query);

        console.log("Database init is over");
    }
}
class UserManagerReader  extends UserManager{
    constructor(){
       super(false);
    }
    async getUser(userId){
        const client= await  this.getClient(false);
        const query = {
            // give the query a unique name
            name: 'fetch-user-by-id',
            text: 'SELECT PK_ID,NAME, EMAIL,AGE FROM USER_MGT_TABLE WHERE PK_ID = $1',
            values: [userId],
        }
        const data=await client.query(query);
        const user=data.rows[0];
        return user?{
            id:user.pk_id,
            name:user.name,
            email:user.email,
            age:user.age
        }:null;  
    }
}

class UserManagerWriter extends UserManager{
    constructor(){
        super(true);
     }

    async createUser(user){
       const client= await this.getClient(true);
       const query = {
        text: `INSERT INTO ${USER_TABLE}(NAME, EMAIL,AGE) VALUES($1, $2,$3) RETURNING pk_id`,
        values: [user.name, user.email,user.age]
      }

      const data=await client.query(query);
      return {...user,...{id:data.rows[0].pk_id}};
    }
}



module.exports.userManagerReader = new UserManagerReader();
module.exports.userManagerWriter = new UserManagerWriter();