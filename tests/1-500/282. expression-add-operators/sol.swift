class Solution {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        let chars = Array(num)
        let n = chars.count
        
        func backtrack(_ idx: Int, _ path: String, _ curr: Int, _ prev: Int) {
            if idx == n {
                if curr == target {
                    res.append(path)
                }
                return
            }
            for i in idx..<n {
                if i > idx && chars[idx] == "0" { break }
                let s = String(chars[idx...i])
                let val = Int(s)!
                if idx == 0 {
                    backtrack(i+1, s, val, val)
                } else {
                    backtrack(i+1, path + "+" + s, curr + val, val)
                    backtrack(i+1, path + "-" + s, curr - val, -val)
                    backtrack(i+1, path + "*" + s, (curr - prev) + (prev * val), prev * val)
                }
            }
        }
        
        if n > 0 {
            backtrack(0, "", 0, 0)
        }
        return res
    }
}
