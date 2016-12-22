import Foundation

public struct DBConfig {
  public let database:String
  public let user:String
  public let password:String
  public let host:String
  public let port:String

  init(_ host:String = "localhost", port:String = "5432", database:String, user:String, password:String = "") {
    self.database = database
    self.user     = user
    self.password = password
    self.host     = host
    self.port     = port
  }
}
