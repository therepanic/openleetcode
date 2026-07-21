class Solution {
    func simplifiedFractions(_ n: Int) -> [String] {
        var fractions: [String] = []
        for numerator in 1..<n {
            for denominator in (numerator + 1)...n {
                if gcd(numerator, denominator) == 1 {
                    fractions.append("\(numerator)/\(denominator)")
                }
            }
        }
        return fractions
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
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
