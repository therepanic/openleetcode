public class Solution {
    public boolean isNumber(String s) {
        boolean seenDigit = false;
        boolean seenDot = false;
        boolean seenExp = false;
        boolean seenDigitAfterExp = true;

        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.isDigit(c)) {
                seenDigit = true;
                seenDigitAfterExp = true;
            } else if (c == '.') {
                if (seenDot || seenExp) {
                    return false;
                }
                seenDot = true;
            } else if (c == 'e' || c == 'E') {
                if (seenExp || !seenDigit) {
                    return false;
                }
                seenExp = true;
                seenDigitAfterExp = false;
            } else if (c == '+' || c == '-') {
                if (i > 0) {
                    char prev = s.charAt(i - 1);
                    if (prev != 'e' && prev != 'E') {
                        return false;
                    }
                }
            } else {
                return false;
            }
        }

        return seenDigit && seenDigitAfterExp;
    }
}
