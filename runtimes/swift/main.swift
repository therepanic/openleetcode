import Foundation

let _TEST_: [String: [String: [String: Any]]] = {
    let data = try! Data(contentsOf: URL(fileURLWithPath: "test.json"))
    return try! JSONSerialization.jsonObject(with: data) as! [String: [String: [String: Any]]]
}()

func testVal(_ caseId: String, _ name: String) -> Any {
    return _TEST_[caseId]![name]!["val"]!
}

${SOLUTION}

${UTILITIES}

${INSERTION}
