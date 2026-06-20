class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var ugly = [Int](repeating: 1, count: n)
        var idx = [Int](repeating: 0, count: primes.count)
        var val = primes.map { Int64($0) }
        for i in 1..<n {
            var m = val[0]
            for j in 1..<val.count {
                if val[j] < m {
                    m = val[j]
                }
            }
            ugly[i] = Int(m)
            for j in 0..<primes.count {
                if val[j] == m {
                    idx[j] += 1
                    val[j] = Int64(ugly[idx[j]]) * Int64(primes[j])
                }
            }
        }
        return ugly[n - 1]
    }
}
