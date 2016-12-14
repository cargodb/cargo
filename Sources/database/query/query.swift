
import Foundation

public enum QueryActions {
  case select(String, [String])
  case insert(String, [String:Any])
  case update(String, [String:Any])
  case delete(String)
  case create(String)
  case alter(String)
  case drop(String)

  var string:String {
    switch self {
      case .select(let table, let fields):
        return "SELECT "  + fields.joined(separator: ",") + " FROM " + table
      case .insert(let table, let fields):
        let keys = fields.keys.joined(separator: ",")
        let vals = (fields.values.map { "'\(String(describing: $0))'" }).joined(separator: ",")
        
        return "INSERT INTO " + table + " (" + keys + ") VALUES (" + vals  + ")"
      case .update(let table, let fields):
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

public class Query {

  public init() {}
}


/*
 
 from(table: "users").select(["username", "password").where(["id" : 1])

let qry = Query { make in
  make.select(["username", "password"])
      .from("users")
      .where(["username" : "wess", "password" : "12qwaszx"])
      .order(by:"date")
      .ascending
}

*/
