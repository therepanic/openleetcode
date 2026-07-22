class Solution {
    func rangeSum(_ nums: [Int], _ n: Int, _ left: Int, _ right: Int) -> Int {
        let MOD = 1000000007
        var sums = [Int]()
        for i in 0..<n {
            var total = 0
            for j in i..<n {
                total += nums[j]
                sums.append(total)
            }
        }
        sums.sort()
        var result = 0
        for i in (left - 1)..<right {
            result = (result + sums[i]) % MOD
        }
        return result
    }
}
