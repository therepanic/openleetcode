public class Solution {
    public int BalancedString(string s) {
        int n = s.Length;
        int each = n / 4;
        var count = new Dictionary<char, int>();
        foreach (char c in s) {
            if (count.ContainsKey(c)) count[c]++;
            else count[c] = 1;
        }
        var extra = new Dictionary<char, int>();
        foreach (var kv in count) {
            if (kv.Value > each) {
                extra[kv.Key] = kv.Value - each;
            }
        }
        if (extra.Count == 0) return 0;
        int left = 0;
        int res = int.MaxValue;
        var curr = new Dictionary<char, int>();
        for (int right = 0; right < n; right++) {
            char rc = s[right];
            if (extra.ContainsKey(rc)) {
                if (curr.ContainsKey(rc)) curr[rc]++;
                else curr[rc] = 1;
            }
            bool AllMet() {
                foreach (var kv in extra) {
                    if (!curr.ContainsKey(kv.Key) || curr[kv.Key] < kv.Value) return false;
                }
                return true;
            }
            while (AllMet() && left <= right) {
                res = Math.Min(res, right - left + 1);
                char lc = s[left];
                if (curr.ContainsKey(lc)) {
                    curr[lc]--;
                    if (curr[lc] == 0) curr.Remove(lc);
                }
                left++;
            }
        }
        return res;
    }
}
