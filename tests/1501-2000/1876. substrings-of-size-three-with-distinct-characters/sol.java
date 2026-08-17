class Solution {
    public int countGoodSubstrings(String s) {
        int n = s.length();
        int count = 0;
        for (int i = 0; i <= n-3; i++) {
            String sub = s.substring(i, i+3);
            if (sub.charAt(0) != sub.charAt(1) && sub.charAt(1) != sub.charAt(2) && sub.charAt(0) != sub.charAt(2)) {
                count++;
            }
        }
        return count;
    }
}
