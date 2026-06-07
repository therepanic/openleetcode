class Solution {
    func romanToInt(_ s: String) -> Int {
        let roman: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let chars = Array(s)
        var res = 0
        for i in 0..<(chars.count - 1) {
            if roman[chars[i]]! < roman[chars[i + 1]]! {
                res -= roman[chars[i]]!
            } else {
                res += roman[chars[i]]!
            }
        }
        return res + roman[chars[chars.count - 1]]!
    }
}
