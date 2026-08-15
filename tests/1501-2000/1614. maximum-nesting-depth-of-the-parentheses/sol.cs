public class Solution {
    public int MaxDepth(string s) {
        int ctr = 0;
        int ans = 0;
        foreach (char ch in s) {
            if (ch == '(') {
                ctr++;
                ans = Math.Max(ans, ctr);
            } else if (ch == ')') {
                ctr--;
            }
        }
        return ans;
    }
}
