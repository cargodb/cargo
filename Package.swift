import PackageDescription

let package = Package(
    name: "cargo",
    targets: [
      Target(name: "cargo",     dependencies:["database", "resource", "validation", "json"]),
      Target(name: "resource",  dependencies:["database", "validation", "json"]),
      Target(name: "json"),
      Target(name: "validation"),
      Target(name: "database"),
    ]
)
