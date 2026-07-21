class Solution {
    public int equalSubstring(String s, String t, int maxCost) {
        int ans = 0, cost = 0, left = 0;
        for (int right = 0; right < s.length(); right++) {
            cost += Math.abs(s.charAt(right) - t.charAt(right));
            while (cost > maxCost) {
                cost -= Math.abs(s.charAt(left) - t.charAt(left));
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
