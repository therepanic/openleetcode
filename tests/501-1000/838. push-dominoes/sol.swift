class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        let s = "L" + dominoes + "R"
        var res = ""
        var prev = 0
        let chars = Array(s)
        for curr in 1..<chars.count {
            if chars[curr] == "." { continue }
            let span = curr - prev - 1
            if prev > 0 { res.append(chars[prev]) }
            if chars[prev] == chars[curr] {
                res += String(repeating: chars[prev], count: span)
            } else if chars[prev] == "L" && chars[curr] == "R" {
                res += String(repeating: ".", count: span)
            } else {
                res += String(repeating: "R", count: span / 2)
                if span % 2 == 1 { res.append(".") }
                res += String(repeating: "L", count: span / 2)
            }
            prev = curr
        }
        return res
    }
}
