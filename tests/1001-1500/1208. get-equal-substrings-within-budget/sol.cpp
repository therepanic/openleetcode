class Solution {
public:
    int equalSubstring(string s, string t, int maxCost) {
        int ans = 0, cost = 0, left = 0;
        for (int right = 0; right < s.length(); right++) {
            cost += abs(s[right] - t[right]);
            while (cost > maxCost) {
                cost -= abs(s[left] - t[left]);
                left++;
            }
            int size = right - left + 1;
            if (size > ans) {
                ans = size;
            }
        }
        return ans;
    }
};
