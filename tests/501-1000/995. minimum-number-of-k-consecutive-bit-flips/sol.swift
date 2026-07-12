class Solution {
    func minKBitFlips(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var ans = 0
        var flips = 0
        var flipped = [Int](repeating: 0, count: n + 1)

        for i in 0...(n - k) {
            flips += flipped[i]
            if (nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0) {
                flips += 1
                ans += 1
                flipped[i + k] -= 1
            }
        }

        for i in (n - k + 1)..<n {
            flips += flipped[i]
            if (nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0) {
                return -1
            }
        }

        return ans
    }
}
