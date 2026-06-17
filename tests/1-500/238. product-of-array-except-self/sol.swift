class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var res = [Int](repeating: 0, count: n)

        var pre = 1
        for i in 0..<n {
            res[i] = pre
            pre *= nums[i]
        }

        var suf = 1
        for i in (0..<n).reversed() {
            res[i] *= suf
            suf *= nums[i]
        }

        return res
    }
}
