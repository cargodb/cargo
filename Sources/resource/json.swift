import Foundation

public protocol JSONResource {
  var json:[String:Any] { get }
  var jsonString:String { get }
}

public extension JSONResource where Self : Resource {
  public var json:[String:Any] {
    return properties.reduce([:]) { current, next in
      var _current = current
      _current[next.0] = next.1.value
 
      return _current
    }
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
