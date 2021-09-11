import Test
@testable import NJS

final class JavaScriptTests: TestCase {
    func testEvaluate() throws {
        let context = try JSContext()
        _ = try context.evaluate("40 + 2")
    }

    func testReferenceErrorException() throws {
        let context = try JSContext()

        let message = """
            ReferenceError: \"x\" is not defined in 1
                at main (native)

            """

        expect(throws: Error(message: message)) {
            try context.evaluate("x()")
        }
    }

    func testSyntaxErrorException() throws {
        let context = try JSContext()

        let message = "SyntaxError: Unexpected end of input in 1"
        expect(throws: Error(message: message)) {
            try context.evaluate("{")
        }
    }
}
