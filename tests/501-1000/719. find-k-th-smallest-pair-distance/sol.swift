class Solution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        let n = nums.count
        var low = 0
        var high = nums[n - 1] - nums[0]

        while low < high {
            let mid = low + (high - low) / 2
            var count = 0
            var j = 0
            for i in 0..<n {
                while j < n && nums[j] - nums[i] <= mid {
                    j += 1
                }
                count += j - i - 1
            }
            if count < k {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}
