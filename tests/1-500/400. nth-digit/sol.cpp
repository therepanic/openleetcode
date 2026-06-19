class Solution {
public:
    int findNthDigit(int n) {
        long long i = 1, count = 9, start = 1;
        long long N = n;

        while (N > i * count) {
            N -= i * count;
            i++;
            count *= 10;
            start *= 10;
        }

        long long number = start + (N - 1) / i;
        string s = to_string(number);
        return s[(N - 1) % i] - '0';
    }
};
