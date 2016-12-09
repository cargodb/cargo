import Foundation
import resource

class X : Resource {
  let firstname = "Wess"
  let lastname  = "Cope"
  let username  = Property(.text)
}

let z = X()

print("Hello, world!")
print("Properties: \(z.properties)")
