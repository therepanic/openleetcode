class Solution {
    func minimumMountainRemovals(_ nums: [Int]) -> Int {
        let n = nums.count
        var lis = [Int](repeating: 1, count: n)
        var lds = [Int](repeating: 1, count: n)

        for i in 0..<n {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    lis[i] = max(lis[i], lis[j] + 1)
                }
            }
        }

        for i in stride(from: n-1, through: 0, by: -1) {
            for j in stride(from: n-1, through: i+1, by: -1) {
                if nums[i] > nums[j] {
                    lds[i] = max(lds[i], lds[j] + 1)
                }
            }
        }

        var maxLen = 0
        for i in 1..<(n-1) {
            if lis[i] > 1 && lds[i] > 1 {
                maxLen = max(maxLen, lis[i] + lds[i] - 1)
            }
        }

        return n - maxLen
    }
}
