class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var m = -1
        var s = -1
        var idx = -1
        for (i, x) in nums.enumerated() {
            if x > m {
                s = m
                m = x
                idx = i
            } else if x > s {
                s = x
            }
        }
        return m >= s * 2 ? idx : -1
    }
}
