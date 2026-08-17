public class Solution {
    private Dictionary<int, int> loc = new Dictionary<int, int>();
    private string expr;
    
    public int MinOperationsToFlip(string expression) {
        expr = expression;
        var stack = new Stack<int>();
        for (int i = expression.Length - 1; i >= 0; --i) {
            if (expression[i] == ')') stack.Push(i);
            else if (expression[i] == '(') loc[stack.Pop()] = i;
        }
        return Fn(0, expression.Length - 1).Item2;
    }
    
    private (int, int) Fn(int lo, int hi) {
        if (lo == hi) return (expr[lo] - '0', 1);
        if (expr[hi] == ')' && loc[hi] == lo) return Fn(lo+1, hi-1);
        int mid = (loc.ContainsKey(hi) ? loc[hi] : hi) - 1;
        var (v, c) = Fn(mid+1, hi);
        var (vv, cc) = Fn(lo, mid-1);
        int val, chg;
        if (expr[mid] == '|') {
            val = v | vv;
            if (v == 0 && vv == 0) chg = Math.Min(c, cc);
            else if (v == 1 && vv == 1) chg = 1 + Math.Min(c, cc);
            else chg = 1;
        } else {
            val = v & vv;
            if (v == 0 && vv == 0) chg = 1 + Math.Min(c, cc);
            else if (v == 1 && vv == 1) chg = Math.Min(c, cc);
            else chg = 1;
        }
        return (val, chg);
    }
}
