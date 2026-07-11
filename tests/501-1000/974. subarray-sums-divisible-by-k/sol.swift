class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var s = 0
        var res = 0
        var hs = [0: 1]
        for num in nums {
            s += num
            var rem = s % k
            if rem < 0 { rem += k }
            res += hs[rem] ?? 0
            hs[rem, default: 0] += 1
        }
        return res
    }
}
