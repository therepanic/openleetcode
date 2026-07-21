class Solution {
    func minSubsequence(_ nums: [Int]) -> [Int] {
        var s = nums.sorted()
        var v = [Int]()
        var l = nums.count
        var sumV = 0, sumRem = s.reduce(0, +)
        while sumV <= sumRem {
            l -= 1
            sumV += s[l]
            sumRem -= s[l]
            v.append(s[l])
        }
        return v
    }
}
