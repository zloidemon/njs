import Test
@testable import NJS

final class JavaScriptTests: TestCase {
    func testEvaluate() {
        scope {
            let context = try JSContext()
            assertNoThrow(try context.evaluate("40 + 2"))
        }
    }

    func testException() {
        scope {
            let context = try JSContext()
            assertThrowsError(try context.evaluate("x()")) { error in
                let expected = """
                    ReferenceError: \"x\" is not defined in 1
                        at main (native)

                    """
                assertEqual("\(error)", expected)
            }

            assertThrowsError(try context.evaluate("{")) { error in
                let expected = "SyntaxError: Unexpected end of input in 1"
                assertEqual("\(error)", expected)
            }
        }
    }
}
