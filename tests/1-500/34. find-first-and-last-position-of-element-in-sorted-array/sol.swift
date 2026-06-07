class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        func bound(_ left: Bool) -> Int {
            var low = 0
            var high = nums.count - 1
            var ans = -1

            while low <= high {
                let mid = low + (high - low) / 2
                if nums[mid] < target {
                    low = mid + 1
                } else if nums[mid] > target {
                    high = mid - 1
                } else {
                    ans = mid
                    if left {
                        high = mid - 1
                    } else {
                        low = mid + 1
                    }
                }
            }

            return ans
        }

        return [bound(true), bound(false)]
    }
}
