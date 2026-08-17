class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        var i = 0
        var j = nums.count - 1
        var count = 0

        while i < j {
            let total = nums[i] + nums[j]
            if total == k {
                count += 1
                i += 1
                j -= 1
            } else if total > k {
                j -= 1
            } else {
                i += 1
            }
        }

        return count
    }
}
