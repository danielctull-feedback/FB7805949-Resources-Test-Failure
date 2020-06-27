
import Foundation

public struct Package {

    public let contents: String
    public init(url: URL) throws {
        let data = try Data(contentsOf: url)
        contents = String(decoding: data, as: UTF8.self)
    }
}
