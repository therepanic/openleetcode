class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        var cur = ""
        gen(0, 0, n, &cur, &res)
        return res
    }

    private func gen(_ open: Int, _ close: Int, _ n: Int, _ cur: inout String, _ res: inout [String]) {
        let openParen: Character = "("
        let closeParen: Character = ")"
        if open == n && close == n {
            res.append(cur)
            return
        }
        if open < n {
            cur.append(openParen)
            gen(open + 1, close, n, &cur, &res)
            cur.removeLast()
        }
        if close < open {
            cur.append(closeParen)
            gen(open, close + 1, n, &cur, &res)
            cur.removeLast()
        }
    }
}
