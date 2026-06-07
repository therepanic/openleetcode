class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var base = x
        var exp = Int64(n)
        if exp < 0 {
            base = 1.0 / base
            exp = -exp
        }

        var ans = 1.0
        while exp > 0 {
            if exp % 2 == 1 {
                ans *= base
            }
            base *= base
            exp /= 2
        }
        return ans
    }
}
