class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1

        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return low
    }
}
