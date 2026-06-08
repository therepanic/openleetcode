class Solution {
    public int myAtoi(String s) {
        int i = 0;
        int n = s.length();
        while (i < n && s.charAt(i) == ' ') {
            i++;
        }
        if (i == n) {
            return 0;
        }

        int sign = 1;
        if (s.charAt(i) == '+' || s.charAt(i) == '-') {
            if (s.charAt(i) == '-') {
                sign = -1;
            }
            i++;
        }

        long res = 0;
        while (i < n && Character.isDigit(s.charAt(i))) {
            int digit = s.charAt(i) - '0';
            if (sign == 1) {
                if (res > Integer.MAX_VALUE / 10 || (res == Integer.MAX_VALUE / 10 && digit > 7)) {
                    return Integer.MAX_VALUE;
                }
            } else {
                if (res > 2147483648L / 10 || (res == 2147483648L / 10 && digit > 8)) {
                    return Integer.MIN_VALUE;
                }
            }
            res = res * 10 + digit;
            i++;
        }

        return (int) (sign == 1 ? res : -res);
    }
}
