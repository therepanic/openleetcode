public class Solution {
    public int numDecodings(String s) {
        if (s.isEmpty() || s.charAt(0) == '0') {
            return 0;
        }

        int prev2 = 1;
        int prev1 = 1;
        for (int i = 1; i < s.length(); i++) {
            int curr = 0;
            if (s.charAt(i) != '0') {
                curr += prev1;
            }
            int value = (s.charAt(i - 1) - '0') * 10 + (s.charAt(i) - '0');
            if (value >= 10 && value <= 26) {
                curr += prev2;
            }
            prev2 = prev1;
            prev1 = curr;
        }

        return prev1;
    }
}
