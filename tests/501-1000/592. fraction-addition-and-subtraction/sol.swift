class Solution {
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

    func fractionAddition(_ expression: String) -> String {
        var fractions: [(Int, Int)] = []
        let chars = Array(expression)
        var i = 0
        while i < chars.count {
            let sign: Character
            if chars[i] == "+" || chars[i] == "-" {
                sign = chars[i]
                i += 1
            } else {
                sign = "+"
            }
            var numerator = 0
            while i < chars.count && chars[i].isNumber {
                numerator = numerator * 10 + Int(String(chars[i]))!
                i += 1
            }
            i += 1
            var denominator = 0
            while i < chars.count && chars[i].isNumber {
                denominator = denominator * 10 + Int(String(chars[i]))!
                i += 1
            }
            if sign == "-" {
                numerator = -numerator
            }
            fractions.append((numerator, denominator))
        }

        var commonDenominator = 1
        for (_, den) in fractions {
            commonDenominator *= den / gcd(commonDenominator, den)
        }

        var totalNumerator = 0
        for (num, den) in fractions {
            totalNumerator += num * (commonDenominator / den)
        }

        let gcdResult = gcd(abs(totalNumerator), commonDenominator)
        totalNumerator /= gcdResult
        commonDenominator /= gcdResult

        return "\(totalNumerator)/\(commonDenominator)"
    }
}
