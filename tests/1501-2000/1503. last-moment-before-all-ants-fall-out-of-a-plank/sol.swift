class Solution {
    func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        var maxVal = 0
        for value in left {
            maxVal = max(value, maxVal)
        }
        for value in right {
            maxVal = max(n - value, maxVal)
        }
        return maxVal
    }
}
