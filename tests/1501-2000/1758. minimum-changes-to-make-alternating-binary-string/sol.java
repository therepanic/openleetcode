class Solution {
    public int minOperations(String s) {
        int c = 0, j = 0, n = s.length();
        for (char ch : s.toCharArray()) {
            if (ch - '0' == j) {
                c++;
            }
            j ^= 1;
        }
        return Math.min(c, n - c);
    }
}
