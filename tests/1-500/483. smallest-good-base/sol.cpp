#include <string>
#include <cmath>
using namespace std;

class Solution {
public:
    string smallestGoodBase(string n) {
        unsigned long long num = stoull(n);
        int maxM = (int)log2((long double)num);
        for (int m = maxM; m >= 1; --m) {
            unsigned long long left = 2;
            unsigned long long right = (unsigned long long)pow((long double)num, 1.0L / m) + 1;
            while (left <= right) {
                unsigned long long mid = left + (right - left) / 2;
                int cmp = compare(mid, m, num);
                if (cmp == 0) {
                    return to_string(mid);
                }
                if (cmp < 0) {
                    left = mid + 1;
                } else {
                    right = mid - 1;
                }
            }
        }
        return to_string(num - 1);
    }

private:
    int compare(unsigned long long base, int m, unsigned long long n) {
        __int128 sum = 1;
        __int128 cur = 1;
        for (int i = 0; i < m; ++i) {
            cur *= base;
            sum += cur;
            if (sum > n) {
                return 1;
            }
        }
        if (sum == n) return 0;
        return -1;
    }
};
