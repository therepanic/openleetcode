class Solution {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        let total = nums.reduce(0, +)
        let target = total % p
        if target == 0 {
            return 0
        }

        var mp: [Int: Int] = [0: -1]
        var prefix = 0
        var res = nums.count

        for (i, x) in nums.enumerated() {
            prefix = (prefix + x) % p
            let need = (prefix - target + p) % p

            if let idx = mp[need] {
                res = min(res, i - idx)
            }

            mp[prefix] = i
        }

        return res == nums.count ? -1 : res
    }
}
