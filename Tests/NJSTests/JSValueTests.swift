import Test
@testable import NJS

final class JSValueTests: TestCase {
    func testIsUndefined() {
        do {
            let context = try JSContext()

            let result = try context.evaluate("undefined")
            assertTrue(result.isUndefined)
            assertFalse(result.isNull)
            assertFalse(result.isBool)
            assertFalse(result.isNumber)
            assertFalse(result.isString)
            assertEqual(try result.toString(), "undefined")
        } catch {
            fail(String(describing: error))
        }
    }

    func testIsNull() {
        do {
            let context = try JSContext()
            let result = try context.evaluate("null")
            assertFalse(result.isUndefined)
            assertTrue(result.isNull)
            assertFalse(result.isBool)
            assertFalse(result.isNumber)
            assertFalse(result.isString)
            assertEqual(try result.toString(), "null")
        } catch {
            fail(String(describing: error))
        }
    }

    func testIsBool() {
        do {
            let context = try JSContext()
            let result = try context.evaluate("true")
            assertFalse(result.isUndefined)
            assertFalse(result.isNull)
            assertTrue(result.isBool)
            assertFalse(result.isNumber)
            assertFalse(result.isString)
            assertEqual(try result.toString(), "true")
            // assertEqual(result.toBool(), true)
        } catch {
            fail(String(describing: error))
        }
    }

    func testIsNumber() {
        do {
            let context = try JSContext()
            let result = try context.evaluate("3.14")
            assertFalse(result.isUndefined)
            assertFalse(result.isNull)
            assertFalse(result.isBool)
            assertTrue(result.isNumber)
            assertFalse(result.isString)
            assertEqual(try result.toString(), "3.14")
            // assertEqual(try result.toDouble(), 3.14)
        } catch {
            fail(String(describing: error))
        }
    }

    func testIsString() {
        do {
            let context = try JSContext()
            let result = try context.evaluate("'success'")
            assertFalse(result.isUndefined)
            assertFalse(result.isNull)
            assertFalse(result.isBool)
            assertFalse(result.isNumber)
            assertTrue(result.isString)
            assertEqual(try result.toString(), "success")
        } catch {
            fail(String(describing: error))
        }
    }

    func testToInt() {
        do {
            let context = try JSContext()
            let result = try context.evaluate("40 + 2")
            assertEqual(try result.toInt(), 42)
        } catch {
            fail(String(describing: error))
        }
    }

    func testToString() {
        do {
            let context = try JSContext()
            let result = try context.evaluate("40 + 2")
            assertEqual(try result.toString(), "42")
        } catch {
            fail(String(describing: error))
        }
    }

     func testProperty() {
         do {
             let context = try JSContext()
             let result = try context.evaluate("""
                 (function(){
                     return { property: 'test' }
                 })()
                 """)

             assertEqual(try result["property"]?.toString(), "test")
         } catch {
             fail(String(describing: error))
         }
     }
}
