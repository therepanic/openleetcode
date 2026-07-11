class Solution {
    func numDupDigitsAtMostN(_ n: Int) -> Int {
        let digits = Array(String(n + 1)).map { Int(String($0))! }
        let nl = digits.count
        var res = 0
        for i in 0..<(nl - 1) {
            res += 9 * perm(9, i)
        }
        var used = Array(repeating: false, count: 10)
        for i in 0..<nl {
            let x = digits[i]
            let start = i == 0 ? 1 : 0
            for y in start..<x {
                if !used[y] {
                    res += perm(9 - i, nl - i - 1)
                }
            }
            if used[x] { break }
            used[x] = true
        }
        return n - res
    }
    
    private func perm(_ n: Int, _ k: Int) -> Int {
        if k < 0 || k > n { return 0 }
        var ans = 1
        for i in 0..<k {
            ans *= (n - i)
        }
        return ans
    }
}
