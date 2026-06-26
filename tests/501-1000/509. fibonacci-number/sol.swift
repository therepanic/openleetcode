class Solution {
    func fib(_ n: Int) -> Int {
        let sqrt5 = sqrt(5.0)
        let fibN = pow((1 + sqrt5) / 2, Double(n)) - pow((1 - sqrt5) / 2, Double(n))
        return Int(round(fibN / sqrt5))
    }
}
