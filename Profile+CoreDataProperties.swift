//
//  Profile+CoreDataProperties.swift
//  RetriveImageInArrayCD
//
//  Created by Akash Belekar on 17/04/23.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var image: Data?
    @NSManaged public var name: String?

}

extension Profile : Identifiable {

}
