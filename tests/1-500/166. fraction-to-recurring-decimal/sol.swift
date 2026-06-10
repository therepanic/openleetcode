class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        if numerator == 0 { return "0" }
        var result = ""
        if (numerator < 0) != (denominator < 0) {
            result.append("-")
        }
        let num = Int64(abs(numerator))
        let den = Int64(abs(denominator))
        result += String(num / den)
        var rem = num % den
        if rem == 0 { return result }
        result.append(".")
        var seen: [Int64: String.Index] = [:]
        while rem != 0 {
            if let idx = seen[rem] {
                result.insert("(", at: idx)
                result.append(")")
                break
            }
            seen[rem] = result.endIndex
            rem *= 10
            result += String(rem / den)
            rem %= den
        }
        return result
    }
}
