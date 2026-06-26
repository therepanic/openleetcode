class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var smallest = arrays[0][0]
        var largest = arrays[0][arrays[0].count - 1]
        var ans = 0
        for i in 1..<arrays.count {
            let curMin = arrays[i][0]
            let curMax = arrays[i][arrays[i].count - 1]
            ans = max(ans, max(largest - curMin, curMax - smallest))
            smallest = min(curMin, smallest)
            largest = max(curMax, largest)
        }
        return ans
    }
}
