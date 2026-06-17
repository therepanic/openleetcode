class Solution {
public:
    int countNumbersWithUniqueDigits(int n) {
        if (n == 0) return 1;
        if (n == 1) return 10;
        int result = 10;
        int current = 9;
        for (int i = 2; i <= n; i++) {
            current *= (10 - (i - 1));
            result += current;
        }
        return result;
    }
};
