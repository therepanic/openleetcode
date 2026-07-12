class Solution {
public:
    int partitionDisjoint(vector<int>& nums) {
        int n = nums.size();
        vector<int> prefixMax(n);
        prefixMax[0] = nums[0];
        for (int i = 1; i < n; ++i) {
            prefixMax[i] = max(prefixMax[i-1], nums[i]);
        }
        
        vector<int> suffixMin(n);
        suffixMin[n-1] = nums[n-1];
        for (int i = n-2; i >= 0; --i) {
            suffixMin[i] = min(suffixMin[i+1], nums[i]);
        }
        
        for (int i = 0; i < n-1; ++i) {
            if (prefixMax[i] <= suffixMin[i+1]) {
                return i + 1;
            }
        }
        return -1;
    }
};
