class Solution {
    func baseNeg2(_ n: Int) -> String {
        if n == 0 {
            return "0"
        }
        var num = n
        var res = [Character]()
        while num != 0 {
            let digit = num & 1
            res.append(Character(String(digit)))
            num = (num - digit) / -2
        }
        return String(res.reversed())
    }
}
