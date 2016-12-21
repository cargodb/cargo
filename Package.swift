import PackageDescription

let package = Package(
    name: "cargo",
    targets: [
      Target(name: "cargo",     dependencies:["database", "resource", "validation", "json"]),
      Target(name: "resource",  dependencies:["validation", "json"]),
      Target(name: "database",  dependencies:["resource"]),
      Target(name: "json"),
      Target(name: "validation"),
    ]
)
