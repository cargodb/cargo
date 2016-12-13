import Foundation

public enum RelationshipType {
  case hasMany
  case belongsTo
}

public class Relationship<T: Resource> : ResourceProperty{
  private let type:RelationshipType

  public var list:[Resource] = []
  
  public init(_ type:RelationshipType) {
    self.type = type
  }

  public func all() -> [T]? {
    return nil
  }

  public func filter(handler:((T) -> Bool)) -> [T]? {
    return (all() ?? []).filter(handler)
  }
  
  public func get(_ where:[String:Any]) -> [T]? {
    return nil
  }
  
  func get(_ id:Int) -> T? {
    return nil
  }
  
  func add(_ resource:Resource) {
    var current = list.filter { $0 != resource }
    current.append(resource)
    
    list = current
  }
}


