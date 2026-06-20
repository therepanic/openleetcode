#include <algorithm>
#include <vector>

using namespace std;

class Solution {
public:
    int maxProfit(int k, vector<int>& prices) {
        int n = static_cast<int>(prices.size());
        if (k == 0 || n < 2) return 0;
        if (k >= n / 2) {
            int ans = 0;
            for (int i = 1; i < n; i++) ans += max(0, prices[i] - prices[i - 1]);
            return ans;
        }

        vector<long long> hold(k + 1, -(1LL << 60));
        vector<long long> free(k + 1, 0);
        for (int price : prices) {
            for (int t = 1; t <= k; t++) {
                hold[t] = max(hold[t], free[t - 1] - price);
                free[t] = max(free[t], hold[t] + price);
            }
        }
        return static_cast<int>(*max_element(free.begin(), free.end()));
    }
};
