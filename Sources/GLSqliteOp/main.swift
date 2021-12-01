import FMDB
import Foundation

let tempPath = NSHomeDirectory()
var tempUrl = URL(fileURLWithPath: tempPath)
tempUrl.appendPathComponent("temp.db")
let db = FMDatabase(url: tempUrl)
if db.open() {
    let sql = "create table if not exists person (name char primary key,age int default 20, sex int);"
    db.executeStatements(sql)
}


let arg = CommandLine.argc
if arg > 1 {
    let args = CommandLine.arguments
    let name = args[1]
    if arg > 2 {
        let age = args[2]
        if arg > 3 {
            let sex = args[3]
            GLPerson.insert(db, name: name, age: Int(age) ?? 20, sex: Int(sex) ?? 1)
        }else{
            GLPerson.insert(db, name: name, age: Int(age) ?? 20)
        }
    }else {
        GLPerson.insert(db, name: name)
    }
    
}else{
    print("输入名称即可现在Person")
}

GLPerson.alldata(db)


