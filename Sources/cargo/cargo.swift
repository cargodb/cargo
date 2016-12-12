import Foundation
import resource

public final class Cargo {
  private var resources:[Resource] = []

  public init(_ address:String) {
  }

  public func register(_ resource:Resource) {
    remove(resource)
    resources.append(resource)
  }

  public func remove(_ resource:Resource) {
    resources = resources.filter { $0 != resource }
  }

  public func migrate() {
  }
}
