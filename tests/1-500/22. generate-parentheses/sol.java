import java.util.*;

public class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> res = new ArrayList<>();
        StringBuilder cur = new StringBuilder();
        backtrack(0, 0, n, cur, res);
        return res;
    }

    private void backtrack(int open, int close, int n, StringBuilder cur, List<String> res) {
        if (open == n && close == n) {
            res.add(cur.toString());
            return;
        }
        if (open < n) {
            cur.append('(');
            backtrack(open + 1, close, n, cur, res);
            cur.deleteCharAt(cur.length() - 1);
        }
        if (close < open) {
            cur.append(')');
            backtrack(open, close + 1, n, cur, res);
            cur.deleteCharAt(cur.length() - 1);
        }
    }
}
