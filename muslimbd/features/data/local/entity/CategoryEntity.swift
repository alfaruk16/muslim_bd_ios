//
//  CategoryEntity.swift
//  muslimbd
//
//  Created by Al Faruk on 30/12/24.
//

import Foundation
import CoreData

@objc(CategoryEntity)
public class CategoryEntity: NSManagedObject {
    
}

extension CategoryEntity {
    
    @nonobjc public class func getchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "Categories")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var code: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var contentBaseURL: String?
    @NSManaged public var userFavouritedThis: Bool
    @NSManaged public var isPremium: Bool
    @NSManaged public var id: String?
    @NSManaged public var createdBy: String?
    @NSManaged public var createdOn: String?
    @NSManaged public var updatedBy: String?
    @NSManaged public var updatedOn: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var appLanguage: String?
    @NSManaged public var sequenceNo: Int
    @NSManaged public var about: String?
   
}

extension CategoryEntity: Identifiable {
    
}

extension CategoryEntity {
    func toCategoryDtoItem() -> CategoryDtoItem {
        return .init(name: name, code: code, imageURL: imageURL, contentBaseURL: contentBaseURL, userFavouritedThis: userFavouritedThis, isPremium: isPremium, id: id, createdBy: createdBy, createdOn: createdOn, updatedBy: updatedBy, updatedOn: updatedOn, isActive: isActive, appLanguage: appLanguage, sequenceNo: sequenceNo, about: about)
    }
}
