import PackageDescription

let package = Package(
    name: "cargo",
    targets: [
      Target(name: "cargo",     dependencies:["database", "resource", "validation"]),
      Target(name: "resource",  dependencies:["database", "validation"]),
      Target(name: "validation"),
      Target(name: "database"),
    ]
)
