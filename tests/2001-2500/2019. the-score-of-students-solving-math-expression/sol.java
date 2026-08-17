import java.util.*;

class Solution {
    private String s;
    private Map<String, Set<Integer>> memo;
    
    private Set<Integer> fn(int lo, int hi) {
        String key = lo + "," + hi;
        if (memo.containsKey(key)) return memo.get(key);
        if (lo + 1 == hi) {
            Set<Integer> tmp = new HashSet<>();
            tmp.add(s.charAt(lo) - '0');
            memo.put(key, tmp);
            return tmp;
        }
        Set<Integer> ans = new HashSet<>();
        for (int mid = lo + 1; mid < hi; mid += 2) {
            for (int x : fn(lo, mid)) {
                for (int y : fn(mid + 1, hi)) {
                    if (s.charAt(mid) == '+' && x + y <= 1000) {
                        ans.add(x + y);
                    } else if (s.charAt(mid) == '*' && x * y <= 1000) {
                        ans.add(x * y);
                    }
                }
            }
        }
        memo.put(key, ans);
        return ans;
    }
    
    public int scoreOfStudents(String s, int[] answers) {
        this.s = s;
        this.memo = new HashMap<>();
        int target = 0;
        // Evaluate expression respecting precedence
        // Simple approach: use a stack
        Stack<Integer> nums = new Stack<>();
        Stack<Character> ops = new Stack<>();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.isDigit(c)) {
                nums.push(c - '0');
            } else if (c == '+' || c == '*') {
                while (!ops.isEmpty() && precedence(ops.peek()) >= precedence(c)) {
                    apply(nums, ops.pop());
                }
                ops.push(c);
            }
        }
        while (!ops.isEmpty()) apply(nums, ops.pop());
        target = nums.pop();
        
        Set<Integer> cand = fn(0, s.length());
        int score = 0;
        for (int x : answers) {
            if (x == target) score += 5;
            else if (cand.contains(x)) score += 2;
        }
        return score;
    }
    
    private int precedence(char c) {
        return c == '*' ? 2 : 1;
    }
    
    private void apply(Stack<Integer> nums, char op) {
        int b = nums.pop();
        int a = nums.pop();
        if (op == '+') nums.push(a + b);
        else nums.push(a * b);
    }
}
