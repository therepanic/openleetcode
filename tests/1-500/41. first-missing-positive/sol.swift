class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let seen = Set(nums)
        var i = 1
        while seen.contains(i) {
            i += 1
        }
        return i
    }
}
