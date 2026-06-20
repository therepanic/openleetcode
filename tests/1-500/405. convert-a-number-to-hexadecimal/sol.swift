class Solution {
    func toHex(_ num: Int) -> String {
        if num == 0 { return "0" }
        var n = num
        if n < 0 { n += 1 << 32 }
        let h = Array("0123456789abcdef")
        var r = [Character]()
        while n > 0 {
            r.append(h[n & 15])
            n /= 16
        }
        return String(r.reversed())
    }
}
