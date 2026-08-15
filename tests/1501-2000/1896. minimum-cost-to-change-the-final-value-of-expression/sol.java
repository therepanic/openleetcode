import java.util.*;

class Solution {
    private Map<Integer, Integer> loc = new HashMap<>();
    private String expr;
    
    public int minOperationsToFlip(String expression) {
        expr = expression;
        Deque<Integer> stack = new ArrayDeque<>();
        for (int i = expression.length() - 1; i >= 0; --i) {
            char ch = expression.charAt(i);
            if (ch == ')') stack.push(i);
            else if (ch == '(') loc.put(stack.pop(), i);
        }
        return fn(0, expression.length()-1)[1];
    }
    
    private int[] fn(int lo, int hi) {
        if (lo == hi) return new int[]{expr.charAt(lo) - '0', 1};
        if (expr.charAt(hi) == ')' && loc.get(hi) == lo) return fn(lo+1, hi-1);
        int mid = (loc.containsKey(hi) ? loc.get(hi) : hi) - 1;
        int[] right = fn(mid+1, hi);
        int[] left = fn(lo, mid-1);
        int v = right[0], c = right[1], vv = left[0], cc = left[1];
        int val, chg;
        if (expr.charAt(mid) == '|') {
            val = v | vv;
            if (v == 0 && vv == 0) chg = Math.min(c, cc);
            else if (v == 1 && vv == 1) chg = 1 + Math.min(c, cc);
            else chg = 1;
        } else {
            val = v & vv;
            if (v == 0 && vv == 0) chg = 1 + Math.min(c, cc);
            else if (v == 1 && vv == 1) chg = Math.min(c, cc);
            else chg = 1;
        }
        return new int[]{val, chg};
    }
}
