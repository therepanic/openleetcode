class Solution {
    func parseBoolExpr(_ expression: String) -> Bool {
        var st: [Character] = []
        for ch in expression {
            if ch == "," { continue }
            if ch != ")" {
                st.append(ch)
                continue
            }
            var hasTrue = false
            var hasFalse = false
            while let last = st.last, last != "(" {
                let v = st.removeLast()
                if v == "t" { hasTrue = true }
                if v == "f" { hasFalse = true }
            }
            st.removeLast()
            let op = st.removeLast()
            if op == "!" {
                st.append(hasTrue ? "f" : "t")
            } else if op == "&" {
                st.append(hasFalse ? "f" : "t")
            } else {
                st.append(hasTrue ? "t" : "f")
            }
        }
        return st[0] == "t"
    }
}
