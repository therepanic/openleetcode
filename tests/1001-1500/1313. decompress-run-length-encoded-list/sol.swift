class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        var a: [Int] = []
        var i = 0
        while i < nums.count {
            let freq = nums[i]
            let val = nums[i + 1]
            a.append(contentsOf: Array(repeating: val, count: freq))
            i += 2
        }
        return a
    }
}
