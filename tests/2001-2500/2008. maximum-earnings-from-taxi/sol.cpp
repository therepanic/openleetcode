#include <algorithm>
#include <vector>

class Solution {
public:
    long long maxTaxiEarnings(int n, vector<vector<int>>& rides) {
        sort(rides.begin(), rides.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[1] < b[1];
        });
        
        vector<pair<long long, long long>> dp;
        dp.push_back({0, 0});
        
        for (const auto& ride : rides) {
            long long start = ride[0], end = ride[1], tip = ride[2];
            
            long long lo = 0, hi = dp.size();
            while (lo < hi) {
                long long mid = lo + (hi - lo) / 2;
                if (dp[mid].first <= start) {
                    lo = mid + 1;
                } else {
                    hi = mid;
                }
            }
            long long i = lo - 1;
            long long profit = dp[i].second + end - start + tip;
            
            if (profit > dp.back().second) {
                dp.push_back({end, profit});
            }
        }
        
        return dp.back().second;
    }
};
