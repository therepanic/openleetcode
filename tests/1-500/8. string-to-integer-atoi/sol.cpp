class Solution {
public:
    int myAtoi(string s) {
        int i = 0;
        int n = (int)s.size();
        while (i < n && s[i] == ' ') {
            ++i;
        }
        if (i == n) {
            return 0;
        }

        int sign = 1;
        if (s[i] == '+' || s[i] == '-') {
            if (s[i] == '-') {
                sign = -1;
            }
            ++i;
        }

        long long res = 0;
        while (i < n && s[i] >= '0' && s[i] <= '9') {
            int digit = s[i] - '0';
            if (sign == 1) {
                if (res > 2147483647LL / 10 || (res == 2147483647LL / 10 && digit > 7)) {
                    return 2147483647;
                }
            } else {
                if (res > 2147483648LL / 10 || (res == 2147483648LL / 10 && digit > 8)) {
                    return -2147483648LL;
                }
            }
            res = res * 10 + digit;
            ++i;
        }

        return (int)(sign == 1 ? res : -res);
    }
};
