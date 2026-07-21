public class Solution {
    public int EqualSubstring(string s, string t, int maxCost) {
        int ans = 0, cost = 0, left = 0;
        for (int right = 0; right < s.Length; right++) {
            cost += Math.Abs(s[right] - t[right]);
            while (cost > maxCost) {
                cost -= Math.Abs(s[left] - t[left]);
                left++;
            }
            int size = right - left + 1;
            if (size > ans) {
                ans = size;
            }
        }
        return ans;
    }
}
