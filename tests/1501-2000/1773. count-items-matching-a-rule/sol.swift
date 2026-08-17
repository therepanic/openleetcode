class Solution {
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        let keyMap = ["type":0, "color":1, "name":2]
        var count = 0
        let idx = keyMap[ruleKey]!
        for item in items {
            if item[idx] == ruleValue {
                count += 1
            }
        }
        return count
    }
}
