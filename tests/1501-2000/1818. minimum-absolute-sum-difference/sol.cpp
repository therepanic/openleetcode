#include <algorithm>
#include <vector>
#include <cmath>

class Solution {
public:
    int minAbsoluteSumDiff(vector<int>& nums1, vector<int>& nums2) {
        const int MOD = 1000000007;
        int n = nums1.size();
        vector<int> sortedNums1 = nums1;
        sort(sortedNums1.begin(), sortedNums1.end());
        long long total = 0;
        long long maxReduction = 0;
        
        for (int i = 0; i < n; i++) {
            int a = nums1[i];
            int b = nums2[i];
            long long currDiff = abs(a - b);
            total += currDiff;
            
            int idx = lower_bound(sortedNums1.begin(), sortedNums1.end(), b) - sortedNums1.begin();
            
            if (idx < n) {
                maxReduction = max(maxReduction, currDiff - abs(sortedNums1[idx] - b));
            }
            if (idx > 0) {
                maxReduction = max(maxReduction, currDiff - abs(sortedNums1[idx - 1] - b));
            }
        }
        
        return (int)((total - maxReduction) % MOD);
    }
};
