class Solution {
    private func helper(_ nums: [Int], _ perK: Int, _ k: Int) -> Bool {
        var count = 1
        var currSum = 0
        for num in nums {
            if currSum + num > perK {
                count += 1
                currSum = num
            } else {
                currSum += num
            }
        }
        return count <= k
    }

    func splitArray(_ nums: [Int], _ k: Int) -> Int {
        let high = nums.reduce(0, +)
        let low = nums.max()!
        var soln = 0
        var l = low
        var h = high
        while l <= h {
            let mid = l + (h - l) / 2
            if helper(nums, mid, k) {
                soln = mid
                h = mid - 1
            } else {
                l = mid + 1
            }
        }
        return soln
    }
}
