import Foundation
import resource

class Goose : Resource, JSONResource {
  let firstname = "Wess"
  let lastname  = "Cope"
  let username  = Property(.text, validation:[.required])
  let birds     = Relationship<Goose>(.hasMany)
}

let z = Goose()
z["username"] = "wesscope"

if z.isValid {
  print("--- NAME: \(Goose.tableName)")
  print("value: \(z["username"])")
  print("Properties: \(z.properties)")
  print("json: \(z.json)")
  print("jsonString: \(z.jsonString)")
} else {
    print("Errrrrrrr")
    print("Err: \(z.errors)")
}
