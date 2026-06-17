class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var ugly = [Int](repeating: 1, count: n)
        var idx = [Int](repeating: 0, count: primes.count)
        var val = primes
        for i in 1..<n {
            let m = val.min()!
            ugly[i] = m
            for j in 0..<primes.count {
                if val[j] == m {
                    idx[j] += 1
                    val[j] = ugly[idx[j]] * primes[j]
                }
            }
        }
        return ugly[n - 1]
    }
}
