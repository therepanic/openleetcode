class Solution {
    public int monotoneIncreasingDigits(int n) {
        char[] s = String.valueOf(n).toCharArray();
        int mark = s.length;
        for (int i = s.length - 1; i > 0; i--) {
            if (s[i] < s[i - 1]) {
                s[i - 1]--;
                mark = i;
            }
        }
        for (int i = mark; i < s.length; i++) {
            s[i] = '9';
        }
        return Integer.parseInt(new String(s));
    }
}
