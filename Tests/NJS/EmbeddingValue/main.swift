import Test
@testable import NJS

test.case("isUndefined") {
    let context = try EmbeddingContext()

    let result = try context.evaluate("undefined")
    expect(result.isUndefined == true)
    expect(result.isNull == false)
    expect(result.isBool == false)
    expect(result.isNumber == false)
    expect(result.isString == false)
    expect(try result.toString() == "undefined")
}

test.case("isNull") {
    let context = try EmbeddingContext()
    let result = try context.evaluate("null")
    expect(result.isUndefined == false)
    expect(result.isNull == true)
    expect(result.isBool == false)
    expect(result.isNumber == false)
    expect(result.isString == false)
    expect(try result.toString() == "null")
}

test.case("isBool") {
    let context = try EmbeddingContext()
    let result = try context.evaluate("true")
    expect(result.isUndefined == false)
    expect(result.isNull == false)
    expect(result.isBool == true)
    expect(result.isNumber == false)
    expect(result.isString == false)
    expect(try result.toString() == "true")
    // expect(result.toBool(), true)
}

test.case("isNumber") {
    let context = try EmbeddingContext()
    let result = try context.evaluate("3.14")
    expect(result.isUndefined == false)
    expect(result.isNull == false)
    expect(result.isBool == false)
    expect(result.isNumber == true)
    expect(result.isString == false)
    expect(try result.toString() == "3.14")
    // expect(try result.toDouble(), 3.14)
}

test.case("isString") {
    let context = try EmbeddingContext()
    let result = try context.evaluate("'success'")
    expect(result.isUndefined == false)
    expect(result.isNull == false)
    expect(result.isBool == false)
    expect(result.isNumber == false)
    expect(result.isString == true)
    expect(try result.toString() == "success")
}

test.case("toInt") {
    let context = try EmbeddingContext()
    let result = try context.evaluate("40 + 2")
    expect(try result.toInt() == 42)
}

test.case("toString") {
    let context = try EmbeddingContext()
    let result = try context.evaluate("40 + 2")
    expect(try result.toString() == "42")
}

test.case("property") {
    let context = try EmbeddingContext()
    let result = try context.evaluate("""
    (function(){
        return { property: 'test' }
    })()
    """)

    expect(try result["property"]?.toString() == "test")
}

test.run()
