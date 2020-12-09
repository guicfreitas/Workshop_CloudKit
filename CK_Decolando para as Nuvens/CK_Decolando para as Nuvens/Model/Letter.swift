//
//  Letter.swift
//  CK_Decolando para as Nuvens
//
//  Created by João Guilherme on 03/12/20.
//

import Foundation
import CloudKit

struct Letter{
    var name: String
    var content: String
    var RecordId : CKRecord.ID? = nil
    
    
    //Criacao do container
    var container: CKContainer {
        return CKContainer(identifier: "iCloud.br.com.WorkshopCK-Test")
    }
    
    
    
    //Parametro da funcao eh uma closure para caso o CloudKit retorne um erro
    func createRecord(completionHandler: @escaping (Error?)->()){
        let record = CKRecord(recordType: "Letter")
        
        //Cast para CKRecordValue pois o compilador swift nao compreende que uma String adota um CKRecordValue
        record["name"] = self.name as CKRecordValue
        record["content"] = self.content as CKRecordValue
        
        
        //RecordId = record.recordID
        
        
        container.publicCloudDatabase.save(record) { _, error in
            
            
            if let error = error {
                completionHandler(error)
            } else {
                completionHandler(nil)
            }
            
            
        }
    }
    
    
    func readRecord(completionHandler: @escaping ([Letter]?,Error?)->()){
        _ = CKRecord(recordType: "Letter")
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Letter", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        
        var letterRecords: [Letter] = []
        
        operation.recordFetchedBlock = { record in
            
            // record é um registro do tipo Letter que foi obtido na operação
            let letter = Letter(name: record["name"] as! String, content: record["content"] as! String, RecordId: record.recordID)
            
            letterRecords.append(letter)
            
            
        }
        
        operation.queryCompletionBlock = { (cursor, error) in
            
            if error == nil {
                completionHandler(letterRecords,nil)
            } else {
                
                completionHandler(nil,error)
            }
            
            
            
        }
        container.publicCloudDatabase.add(operation)
        
    }
    
    func deleteRecordWithId(completionHandler: @escaping (Error?)->()){
        container.publicCloudDatabase.delete(withRecordID: self.RecordId!){
            (_,error) in
            if error == nil{
                completionHandler(nil)
            }else{
                completionHandler(error)
            }
        }
    }
    
    func updateRecordWithId(name:String, content:String, completionHandler: @escaping (Error?)->()){
        container.publicCloudDatabase.fetch(withRecordID: self.RecordId!){
            (record,error) in
            guard let record = record,error == nil else{
                completionHandler(error!)
                return
            }
            
            //Cast para CKRecordValue pois o compilador swift nao compreende que uma String adota um CKRecordValue
            record["name"] = name as CKRecordValue
            record["content"] = content as CKRecordValue
            
            
            container.publicCloudDatabase.save(record) { _, error in
                
                
                if let error = error {
                    completionHandler(error)
                } else {
                    completionHandler(nil)
                }
                
                
            }
            
        }
    }
    
    func createSubscription(completionHandler: @escaping (Error?)->()){
        let subscription = CKQuerySubscription(recordType: "Letter",
                                               predicate: NSPredicate(value: true),
                                               options: [.firesOnRecordCreation])
       
        
        
        let info = CKSubscription.NotificationInfo()
        info.alertLocalizationKey = "letter_registered_alert"
        info.alertLocalizationArgs = ["name"]
        info.soundName = "default"
        info.desiredKeys = ["name"]
        info.alertBody = "nova carta criada"
        subscription.notificationInfo = info
        
        
        container.publicCloudDatabase.save(subscription) { savedSubscription, error in
            if let error = error {
                completionHandler(error)
            } else {
                UserDefaults.standard.set(savedSubscription!.subscriptionID, forKey: "subscriptionID")
                completionHandler(nil)
            } 
        }
    }
    
    
}


