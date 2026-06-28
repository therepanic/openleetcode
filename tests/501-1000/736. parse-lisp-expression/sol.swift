class Solution {
    func evaluate(_ expression: String) -> Int {
        func isnum(_ t: String) -> Bool {
            let c = t.first!
            return c == "-" || c.isNumber
        }
        
        func lookup(_ v: String, _ env: inout [[String: Int]]) -> Int {
            for d in env.reversed() {
                if let val = d[v] {
                    return val
                }
            }
            return 0
        }
        
        func toks(_ s: String) -> [String] {
            var res = [String]()
            var i = s.startIndex
            let n = s.endIndex
            var bal = 0
            var st = s.startIndex
            while i < n {
                let c = s[i]
                if c == "(" {
                    bal += 1
                } else if c == ")" {
                    bal -= 1
                } else if c == " " && bal == 0 {
                    if st < i {
                        res.append(String(s[st..<i]))
                    }
                    st = s.index(after: i)
                }
                i = s.index(after: i)
            }
            if st < n {
                res.append(String(s[st..<n]))
            }
            return res
        }
        
        func evals(_ e: String, _ env: inout [[String: Int]]) -> Int {
            if e.first != "(" {
                if isnum(e) { return Int(e)! }
                return lookup(e, &env)
            }
            let inner = String(e[e.index(after: e.startIndex)..<e.index(before: e.endIndex)])
            let parts = toks(inner)
            let op = parts[0]
            if op == "add" { return evals(parts[1], &env) + evals(parts[2], &env) }
            if op == "mult" { return evals(parts[1], &env) * evals(parts[2], &env) }
            
            var loc = [String: Int]()
            env.append(loc)
            var i = 1
            while i < parts.count - 1 {
                let v = parts[i]
                let val = evals(parts[i + 1], &env)
                env[env.count - 1][v] = val
                i += 2
            }
            let ans = evals(parts.last!, &env)
            env.removeLast()
            return ans
        }
        
        var env = [[String: Int]]()
        return evals(expression, &env)
    }
}
