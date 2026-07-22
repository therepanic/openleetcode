class Solution {
    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        let mod = 1000000007
        var values = nums.sorted()
        let n = values.count

        var power = [Int](repeating: 1, count: n)
        for i in 1..<n {
            power[i] = (power[i - 1] * 2) % mod
        }

        var left = 0, right = n - 1
        var result = 0

        while left <= right {
            if values[left] + values[right] <= target {
                result = (result + power[right - left]) % mod
                left += 1
            } else {
                right -= 1
            }
        }

        return result
    }
}
