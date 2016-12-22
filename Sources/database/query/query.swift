
import Foundation
import resource

public enum QueryAction {
  case select([String])
  case insert([String:Any])
  case update([String:Any])
  case delete(String)
  case create(String)
  case alter(String)
  case drop(String)

  public func sql(_ table:String) -> String {
    switch self {
      case .select(let fields):
        return "SELECT "  + fields.joined(separator: ",") + " FROM "
      case .insert(let fields):
        let keys = fields.keys.joined(separator: ",")
        let vals = (fields.values.map { "'\(String(describing: $0))'" }).joined(separator: ",")

        return "INSERT INTO " + table + "(" + keys + ") VALUES (" + vals  + ")"
      case .update(let fields):
        let equals = fields.reduce([]) { collection, current in
          collection + ["\(current.key)='\(current.value)'"]
        }.joined(separator: ",")

        return "UPDATE " + table + " SET " + equals
      case .delete(let table):
        return "DELETE " + table
      case .create(let table):
        return "CREATE " + table
      case .alter(let table):
        return "ALTER " + table
      case .drop(let table):
        return "DROP " + table
    }
  }
}

