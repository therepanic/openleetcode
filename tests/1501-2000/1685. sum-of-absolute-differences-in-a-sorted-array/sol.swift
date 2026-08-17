class Solution {
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var pref = Array(repeating: 0, count: n)
        pref[0] = nums[0]
        for i in 1..<n { pref[i] = pref[i-1] + nums[i] }
        var ans = [Int]()
        for i in 0..<n {
            let left = i > 0 ? pref[i-1] : 0
            let right = pref[n-1] - pref[i]
            ans.append(right - left + (2*i - n + 1) * nums[i])
        }
        return ans
    }
}
