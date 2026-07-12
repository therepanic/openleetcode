class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var count = 0
        let s = heights.sorted()
        for i in 0..<heights.count {
            if heights[i] != s[i] {
                count += 1
            }
        }
        return count
    }
}
