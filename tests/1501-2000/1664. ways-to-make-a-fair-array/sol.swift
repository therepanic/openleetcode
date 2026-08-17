class Solution {
    func waysToMakeFair(_ nums: [Int]) -> Int {
        var even = 0
        var odd = 0
        var even_left = 0
        var odd_left = 0
        var result = 0
        for (idx, ele) in nums.enumerated() {
            if idx % 2 == 0 {
                even += ele
            } else {
                odd += ele
            }
        }
        for (idx, ele) in nums.enumerated() {
            if idx % 2 == 0 {
                even -= ele
            } else {
                odd -= ele
            }
            if even + odd_left == odd + even_left {
                result += 1
            }
            if idx % 2 == 0 {
                even_left += ele
            } else {
                odd_left += ele
            }
        }
        return result
    }
}
