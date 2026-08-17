class Solution {
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        let n = colors.count
        var sum = 0
        var time = neededTime // local mutable copy
        let chars = Array(colors)
        for i in 1..<n {
            if chars[i] == chars[i - 1] {
                sum += min(time[i], time[i - 1])
                time[i] = max(time[i], time[i - 1])
            }
        }
        return sum
    }
}
