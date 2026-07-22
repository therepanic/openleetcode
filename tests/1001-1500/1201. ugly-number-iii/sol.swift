class Solution {
    func nthUglyNumber(_ n: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
        func gcd(_ x: Int, _ y: Int) -> Int {
            var xx = x
            var yy = y
            while yy != 0 {
                let temp = yy
                yy = xx % yy
                xx = temp
            }
            return xx
        }
        
        func lcm(_ x: Int, _ y: Int) -> Int {
            let reduced = x / gcd(x, y)
            let limit = 2_000_000_001
            return reduced > limit / y ? limit : reduced * y
        }
        
        let ab = lcm(a, b)
        let ac = lcm(a, c)
        let bc = lcm(b, c)
        let abc = lcm(ab, c)
        
        var left = 1
        var right = 2_000_000_000
        
        while left < right {
            let mid = left + (right - left) / 2
            let cnt = mid / a + mid / b + mid / c -
                      mid / ab - mid / ac - mid / bc +
                      mid / abc
            if cnt >= n {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}
