class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var nums = [Int]()
        var factorial = Array(repeating: 1, count: n + 1)

        for i in 1...n {
            nums.append(i)
            factorial[i] = factorial[i - 1] * i
        }

        var k = k - 1
        var res = ""
        for remaining in stride(from: n, through: 1, by: -1) {
            let block = factorial[remaining - 1]
            let idx = k / block
            k %= block
            res += String(nums[idx])
            nums.remove(at: idx)
        }
        return res
    }
}
