using System.Collections.Generic;
using System.Text;

public class Solution {
    public IList<string> GenerateParenthesis(int n) {
        var res = new List<string>();
        var cur = new StringBuilder();
        Backtrack(0, 0, n, cur, res);
        return res;
    }

    private void Backtrack(int open, int close, int n, StringBuilder cur, List<string> res) {
        if (open == n && close == n) {
            res.Add(cur.ToString());
            return;
        }
        if (open < n) {
            cur.Append('(');
            Backtrack(open + 1, close, n, cur, res);
            cur.Length--;
        }
        if (close < open) {
            cur.Append(')');
            Backtrack(open, close + 1, n, cur, res);
            cur.Length--;
        }
    }
}
