class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let aChars = Array(a)
        let bChars = Array(b)
        var i = aChars.count - 1
        var j = bChars.count - 1
        var carry = 0
        var res = [Character]()

        while i >= 0 || j >= 0 || carry > 0 {
            var sum = carry
            if i >= 0 {
                sum += aChars[i].wholeNumberValue!
                i -= 1
            }
            if j >= 0 {
                sum += bChars[j].wholeNumberValue!
                j -= 1
            }
            res.append(sum % 2 == 0 ? "0" : "1")
            carry = sum / 2
        }

        return String(res.reversed())
    }
}
