//
//  DataBaseHelper.swift
//  RetriveImageInArrayCD
//
//  Created by Akash Belekar on 17/04/23.
//

import Foundation
import CoreData
import UIKit

class DataBaseHelper{
    static let shared = DataBaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func getProfileData(objec:[String:String],imageData:Data){
        var profile = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: context!) as? Profile
        profile?.name = objec["name"]
        profile!.image = imageData
       
        do {
            try context?.save()
        } catch  {
            print("Not saved image..")
        }
    }
    
    //fetch data and show on tableview
    func getAllProfile() -> [Profile]{
        var profile = [Profile]()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        
        do {
            profile = try context?.fetch(fetchRequest) as! [Profile]
        } catch  {
            print("Not to be Saved Profile")
        }
        return profile
    }
    
    //delete Row
    
    func getDeleteData(index:Int) -> [Profile]{
        var studentData = getAllProfile()
        
        context?.delete(studentData[index]) // delete from context
        studentData.remove(at: index) // delete from array
        
        do {
            try context?.save()
        } catch  {
            print("Not Deleted..")
        }
        return studentData
    }
    
    //Edit
    
    func getEditData(object:[String:String],image:Data,indexpath:Int) -> [Profile]{
        var profileData = getAllProfile()
        profileData[indexpath].name = object["name"]
        profileData[indexpath].image = image
        
        do {
            try context?.save()
        } catch  {
            print("")
        }
        return profileData
    }
}
