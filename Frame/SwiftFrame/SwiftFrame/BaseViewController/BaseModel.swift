//
//  BaseModel.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/20.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit
import Mantle
class BaseModel: MTLModel , MTLJSONSerializing{
    /// Specifies how to map property keys to different key paths in JSON.
    ///
    /// Subclasses overriding this method should combine their values with those of
    /// `super`.
    ///
    /// Values in the dictionary can either be key paths in the JSON representation
    /// of the receiver or an array of such key paths. If an array is used, the
    /// deserialized value will be a dictionary containing all of the keys in the
    /// array.
    ///
    /// Any keys omitted will not participate in JSON serialization.
    ///
    /// Examples
    ///
    ///     + (NSDictionary *)JSONKeyPathsByPropertyKey {
    ///         return @{
    ///             @"name": @"POI.name",
    ///             @"point": @[ @"latitude", @"longitude" ],
    ///             @"starred": @"starred"
    ///         };
    ///     }
    ///
    /// This will map the `starred` property to `JSONDictionary[@"starred"]`, `name`
    /// to `JSONDictionary[@"POI"][@"name"]` and `point` to a dictionary equivalent
    /// to:
    ///
    ///     @{
    ///         @"latitude": JSONDictionary[@"latitude"],
    ///         @"longitude": JSONDictionary[@"longitude"]
    ///     }
    ///
    /// Returns a dictionary mapping property keys to one or multiple JSON key paths
    /// (as strings or arrays of strings).
    public static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return nil
    }
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    required init(dictionary dictionaryValue: [AnyHashable : Any]!) throws {
        fatalError("init(dictionary:) has not been implemented")
    }
    
    required init!(coder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print(key)
    }

}
