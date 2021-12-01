//
//  File.swift
//  
//
//  Created by Kathy on 2021/12/1.
//
import FMDB
import Foundation

struct GLPerson {
    static func insert(_ db: FMDatabase, name: String, age: Int = 20, sex: Int = 1) {
//        let sql = String(format: "insert into person values ('%@' , %d , %d)", name,age,sex)
//        db.executeStatements(sql)
        
        do {
            try db.executeUpdate("insert into person values (?,?,?)", values: [name,age,sex])
            print("插入成功")
        } catch {
            print("插入失败")
            print(error)
        }
        
    }
    
    static func alldata(_ db: FMDatabase){
        let sql = "select * from person"
        do {
            let set = try db.executeQuery(sql, values: nil)
            while set.next() {
                let name = set.string(forColumn: "name")
                let age = set.int(forColumn: "age")
                let sex = set.int(forColumn: "sex")
                print(name! + "\tage = \(age)\tsex = \(sex == 1 ? "男" : "女")")
            }
            set.close()
        } catch {
            print("查询失败 失败")
        }
        
    }
}
