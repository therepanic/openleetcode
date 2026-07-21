class Solution {
    func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
        if k == 0 {
            return true
        }
        var prev: Int?
        for (i, num) in nums.enumerated() {
            if num == 1 {
                if let p = prev, i - p <= k {
                    return false
                }
                prev = i
            }
        }
        return true
    }
}
