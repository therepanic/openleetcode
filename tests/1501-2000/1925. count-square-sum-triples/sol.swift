class Solution {
    func countTriples(_ n: Int) -> Int {
        var cnt = 0
        let nsqrt = Int(Double(n).squareRoot())
        if nsqrt < 2 { return 0 }
        for s in 2...nsqrt {
            let start = (s & 1) + 1
            var t = start
            while t < s {
                if gcd(s, t) != 1 {
                    t += 2
                    continue
                }
                let c = s * s + t * t
                if c > n { break }
                let k = n / c
                cnt += 2 * k
                t += 2
            }
        }
        return cnt
    }
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        return x
    }
}
