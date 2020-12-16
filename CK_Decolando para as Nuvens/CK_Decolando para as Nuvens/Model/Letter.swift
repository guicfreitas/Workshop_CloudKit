//
//  Letter.swift
//  CK_Decolando para as Nuvens
//
//  Created by João Guilherme on 03/12/20.
//

import Foundation
//import CloudKit

struct Letter{
    var name: String
    var content: String
//    var RecordId : CKRecord.ID? = nil
    
//    var container: CKContainer {
//
//    }
    
    func createRecord(completionHandler: @escaping (Error?)->()){
        //CODE HERE!
    }
    
    func readRecords(completionHandler: @escaping ([Letter]?,Error?)->()){
        //CODE HERE!
    }
    
    func deleteRecord(completionHandler: @escaping (Error?)->()){
        //CODE HERE!
    }
    
    func updateRecord(name:String, content:String, completionHandler: @escaping (Error?)->()){
        //CODE HERE [CHALLENGE]!
    }
    
    func createSubscription(completionHandler: @escaping (Error?)->()){
        //CODE HERE!
    }
}
