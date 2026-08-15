class Solution {
    func canEat(_ candiesCount: [Int], _ queries: [[Int]]) -> [Bool] {
        let n = candiesCount.count
        let m = queries.count
        var ans = [Bool](repeating: false, count: m)
        var psum = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            psum[i] = psum[i - 1] + candiesCount[i - 1]
        }
        for i in 0..<m {
            let t = queries[i][0]
            let day = queries[i][1]
            let cap = queries[i][2]
            let minDays = psum[t] / cap
            let maxDays = psum[t + 1] - 1
            ans[i] = minDays <= day && day <= maxDays
        }
        return ans
    }
}
