import Test
@testable import NJS

final class JSValueTests: TestCase {
    func testIsUndefined() throws {
        let context = try JSContext()

        let result = try context.evaluate("undefined")
        expect(result.isUndefined == true)
        expect(result.isNull == false)
        expect(result.isBool == false)
        expect(result.isNumber == false)
        expect(result.isString == false)
        expect(try result.toString() == "undefined")
    }

    func testIsNull() throws {
        let context = try JSContext()
        let result = try context.evaluate("null")
        expect(result.isUndefined == false)
        expect(result.isNull == true)
        expect(result.isBool == false)
        expect(result.isNumber == false)
        expect(result.isString == false)
        expect(try result.toString() == "null")
    }

    func testIsBool() throws {
        let context = try JSContext()
        let result = try context.evaluate("true")
        expect(result.isUndefined == false)
        expect(result.isNull == false)
        expect(result.isBool == true)
        expect(result.isNumber == false)
        expect(result.isString == false)
        expect(try result.toString() == "true")
        // expect(result.toBool(), true)
    }

    func testIsNumber() throws {
        let context = try JSContext()
        let result = try context.evaluate("3.14")
        expect(result.isUndefined == false)
        expect(result.isNull == false)
        expect(result.isBool == false)
        expect(result.isNumber == true)
        expect(result.isString == false)
        expect(try result.toString() == "3.14")
        // expect(try result.toDouble(), 3.14)
    }

    func testIsString() throws {
        let context = try JSContext()
        let result = try context.evaluate("'success'")
        expect(result.isUndefined == false)
        expect(result.isNull == false)
        expect(result.isBool == false)
        expect(result.isNumber == false)
        expect(result.isString == true)
        expect(try result.toString() == "success")
    }

    func testToInt() throws {
        let context = try JSContext()
        let result = try context.evaluate("40 + 2")
        expect(try result.toInt() == 42)
    }

    func testToString() throws {
        let context = try JSContext()
        let result = try context.evaluate("40 + 2")
        expect(try result.toString() == "42")
    }

     func testProperty() throws {
         let context = try JSContext()
         let result = try context.evaluate("""
             (function(){
                 return { property: 'test' }
             })()
             """)

         expect(try result["property"]?.toString() == "test")
     }
}
