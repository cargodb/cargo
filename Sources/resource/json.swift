import Foundation

public protocol JSONResource {
  var json:[String:Any] { get }
  var jsonString:String { get }
}

public extension JSONResource where Self : Resource {
  private func convertProperties() -> [String:Any] {
    return properties.reduce([:]) { current, next in
      var _current = current
      
      if let property = next.1 as? Property {
        _current[next.0] = property.value
      } else if let relationship = next.1 as? Relationship {
        _current[next.0] = convertRelationships(relationship)
      }
      
      return _current
    }
  }
  
  private func convertRelationships(_ relationship:Relationship<Resource>) -> [String:Any] {
    return relationship.list.reduce([:]) { current, next in
      var _current = current
      
      for (name, value) in next.properties {
        if let property = value as? Property {
          _current[name] = property.value
        }
        else if let rel = value as? Relationship {
          _current[name] = convertRelationships(rel)
        }
      }
      
      return _current
    }
  }
  
  public var json:[String:Any] {
    return [:]
  }
  
  public var jsonString:String {
    do {
      let data              = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
      guard let jsonString  = String(data: data, encoding: .utf8) else { fatalError("Unable to convert json dictionary to string") }
      
      return jsonString
      
    } catch {
      fatalError("Unable to encode resource's json dictionary")
    }
    
    return ""
  }
}
