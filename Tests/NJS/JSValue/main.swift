import Test
@testable import NJS

test.case("IsUndefined") {
    let context = try JSContext()

    let result = try context.evaluate("undefined")
    expect(result.isUndefined == true)
    expect(result.isNull == false)
    expect(result.isBool == false)
    expect(result.isNumber == false)
    expect(result.isString == false)
    expect(try result.toString() == "undefined")
}

test.case("IsNull") {
    let context = try JSContext()
    let result = try context.evaluate("null")

    expect(result.isUndefined == false)
    expect(result.isNull == true)
    expect(result.isBool == false)
    expect(result.isNumber == false)
    expect(result.isString == false)
    expect(try result.toString() == "null")
}

test.case("IsBool") {
    let context = try JSContext()
    let result = try context.evaluate("true")

    expect(result.isUndefined == false)
    expect(result.isNull == false)
    expect(result.isBool == true)
    expect(result.isNumber == false)
    expect(result.isString == false)
    expect(try result.toString() == "true")
    // expect(result.toBool() == true)
}

test.run()

/*
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
*/
