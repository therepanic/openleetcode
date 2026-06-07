public class Solution {
    public int MyAtoi(string s) {
        int i = 0;
        int n = s.Length;
        while (i < n && s[i] == ' ') {
            i++;
        }
        if (i == n) {
            return 0;
        }

        int sign = 1;
        if (s[i] == '+' || s[i] == '-') {
            if (s[i] == '-') {
                sign = -1;
            }
            i++;
        }

        long res = 0;
        while (i < n && char.IsDigit(s[i])) {
            int digit = s[i] - '0';
            if (sign == 1) {
                if (res > int.MaxValue / 10 || (res == int.MaxValue / 10 && digit > 7)) {
                    return int.MaxValue;
                }
            } else {
                if (res > 2147483648L / 10 || (res == 2147483648L / 10 && digit > 8)) {
                    return int.MinValue;
                }
            }
            res = res * 10 + digit;
            i++;
        }

        return (int)(sign == 1 ? res : -res);
    }
}
