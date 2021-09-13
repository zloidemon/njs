import Test
@testable import NJS

test.case("evaluate") {
    let context = try EmbeddedContext()
    _ = try context.evaluate("40 + 2")
}

test.case("ReferenceError exception") {
    let context = try EmbeddedContext()

    let message = """
        ReferenceError: "x" is not defined
            at main (:1)

        """

    expect(throws: Error(message: message)) {
        try context.evaluate("x()")
    }
}

test.case("SyntaxError exception") {
    let context = try EmbeddedContext()

    let message = "SyntaxError: Unexpected end of input in 1"
    expect(throws: Error(message: message)) {
        try context.evaluate("{")
    }
}

test.run()
