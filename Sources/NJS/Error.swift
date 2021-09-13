import CNJS

struct EmbeddedError: Swift.Error {
    let message: String
    let source: String

    init(message: String, source: String = "") {
        self.message = message
        self.source = source
    }

    init(from source: String, in vm: OpaquePointer) {
        self.message = String(retvalIn: vm)
        self.source = source
    }
}

extension EmbeddedError: CustomStringConvertible {
    var description: String {
        return message
    }
}

extension EmbeddedError: Equatable {
    static func ==(lhs: EmbeddedError, rhs: EmbeddedError) -> Bool {
        return lhs.message == rhs.message
    }
}
