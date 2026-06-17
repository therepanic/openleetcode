class Solution {
    func isAdditiveNumber(_ num: String) -> Bool {
        func addStrings(_ a: String, _ b: String) -> String {
            let aa = Array(a.utf8)
            let bb = Array(b.utf8)
            var i = aa.count - 1
            var j = bb.count - 1
            var carry = 0
            var out: [Character] = []
            while i >= 0 || j >= 0 || carry != 0 {
                var sum = carry
                if i >= 0 { sum += Int(aa[i] - 48); i -= 1 }
                if j >= 0 { sum += Int(bb[j] - 48); j -= 1 }
                out.append(Character(UnicodeScalar(48 + sum % 10)!))
                carry = sum / 10
            }
            return String(out.reversed())
        }

        let chars = Array(num)
        let n = chars.count
        for i in 1..<n {
            if chars[0] == "0" && i > 1 { break }
            for j in i+1..<n {
                if chars[i] == "0" && j > i + 1 { break }
                var a = String(chars[0..<i])
                var b = String(chars[i..<j])
                var k = j
                var used = 2
                while k < n {
                    let c = addStrings(a, b)
                    if k + c.count > n || !String(chars[k...]).hasPrefix(c) { break }
                    k += c.count
                    a = b
                    b = c
                    used += 1
                }
                if k == n && used >= 3 { return true }
            }
        }
        return false
    }
}
