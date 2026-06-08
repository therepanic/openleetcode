class Solution {
public:
    int reverse(int x) {
        long long res = 0;
        while (x != 0) {
            res = res * 10 + x % 10;
            x /= 10;
            if (res < -2147483648LL || res > 2147483647LL) {
                return 0;
            }
        }
        return (int)res;
    }
};
