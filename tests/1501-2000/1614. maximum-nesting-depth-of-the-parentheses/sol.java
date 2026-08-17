class Solution {
    public int maxDepth(String s) {
        int ctr = 0;
        int ans = 0;
        for (char ch : s.toCharArray()) {
            if (ch == '(') {
                ctr++;
                ans = Math.max(ans, ctr);
            } else if (ch == ')') {
                ctr--;
            }
        }
        return ans;
    }
}
