public class Solution {
    public IList<string> AddOperators(string num, int target) {
        IList<string> res = new List<string>();
        int n = num.Length;
        
        void Backtrack(int idx, string path, long curr, long prev) {
            if (idx == n) {
                if (curr == target) {
                    res.Add(path);
                }
                return;
            }
            long val = 0;
            for (int i = idx; i < n; i++) {
                if (i > idx && num[idx] == '0') break;
                val = val * 10 + (num[i] - '0');
                string s = num.Substring(idx, i - idx + 1);
                if (idx == 0) {
                    Backtrack(i + 1, s, val, val);
                } else {
                    Backtrack(i + 1, path + "+" + s, curr + val, val);
                    Backtrack(i + 1, path + "-" + s, curr - val, -val);
                    Backtrack(i + 1, path + "*" + s, (curr - prev) + (prev * val), prev * val);
                }
            }
        }
        
        if (n > 0) {
            Backtrack(0, "", 0, 0);
        }
        return res;
    }
}
