public class Solution {
    private string s;
    private Dictionary<(int,int), HashSet<int>> memo;
    
    private HashSet<int> Fn(int lo, int hi) {
        var key = (lo, hi);
        if (memo.ContainsKey(key)) return memo[key];
        if (lo + 1 == hi) {
            var tmp = new HashSet<int> { s[lo] - '0' };
            memo[key] = tmp;
            return tmp;
        }
        var result = new HashSet<int>();
        for (int mid = lo + 1; mid < hi; mid += 2) {
            foreach (int x in Fn(lo, mid)) {
                foreach (int y in Fn(mid + 1, hi)) {
                    if (s[mid] == '+' && x + y <= 1000) {
                        result.Add(x + y);
                    } else if (s[mid] == '*' && x * y <= 1000) {
                        result.Add(x * y);
                    }
                }
            }
        }
        memo[key] = result;
        return result;
    }
    
    public int ScoreOfStudents(string s, int[] answers) {
        this.s = s;
        this.memo = new Dictionary<(int,int), HashSet<int>>();
        
        // target evaluation with precedence
        var nums = new Stack<int>();
        var ops = new Stack<char>();
        for (int i = 0; i < s.Length; i++) {
            char c = s[i];
            if (char.IsDigit(c)) {
                nums.Push(c - '0');
            } else if (c == '+' || c == '*') {
                while (ops.Count > 0 && Precedence(ops.Peek()) >= Precedence(c)) {
                    Apply(nums, ops);
                }
                ops.Push(c);
            }
        }
        while (ops.Count > 0) Apply(nums, ops);
        int target = nums.Peek();
        
        var cand = Fn(0, s.Length);
        int score = 0;
        foreach (int x in answers) {
            if (x == target) score += 5;
            else if (cand.Contains(x)) score += 2;
        }
        return score;
    }
    
    private int Precedence(char c) => c == '*' ? 2 : 1;
    
    private void Apply(Stack<int> nums, Stack<char> ops) {
        int b = nums.Pop();
        int a = nums.Pop();
        char op = ops.Pop();
        nums.Push(op == '+' ? a + b : a * b);
    }
}
