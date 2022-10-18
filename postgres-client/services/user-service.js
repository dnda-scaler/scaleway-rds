const { v4: uuidv4 } = require('uuid');
const {userManagerReader,userManagerWriter}=require("../manager/user-manager")
class UserService {

    async create(user){
        console.log("Push user data within the RDB Database start");
        const result=await userManagerWriter.createUser(user);
        console.log("Push user data within the RDB Database is over");
        return result;
    }
    async get(userId){
        console.log("Get user data within the RDB Database start ",userId);
        const result=await userManagerReader.getUser(userId);
        console.log("Get user data within the RDB Database is over",userId);
        return result;
    }

}
module.exports = new UserService();