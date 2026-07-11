class Solution {
    func nthMagicalNumber(_ n: Int, _ a: Int, _ b: Int) -> Int {
        let mod = 1000000007
        let g = gcd(a, b)
        let lcm = a / g * b
        var lo = min(a, b)
        var hi = n * lo
        while lo < hi {
            let mid = (lo + hi) >> 1
            let cnt = mid / a + mid / b - mid / lcm
            if cnt < n {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo % mod
    }
    
    private func gcd(_ x: Int, _ y: Int) -> Int {
        var a = x
        var b = y
        while b != 0 {
            let t = b
            b = a % b
            a = t
        }
        return a
    }
}
