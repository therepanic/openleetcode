class Solution {
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        var low = 1
        var high = nums.max()!
        var ans = high

        while low <= high {
            let mid = low + (high - low) / 2

            var total = 0
            for num in nums {
                total += (num + mid - 1) / mid
            }

            if total <= threshold {
                ans = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return ans
    }
}
