class Solution {
public:
    int maxWidthRamp(vector<int>& nums) {
        int n = nums.size();
        vector<int> right_max(n);
        right_max[n - 1] = nums[n - 1];
        
        for (int i = n - 2; i >= 0; i--) {
            right_max[i] = max(nums[i], right_max[i + 1]);
        }
        
        int i = 0, j = 0, result = 0;
        while (j < n) {
            if (nums[i] <= right_max[j]) {
                result = max(result, j - i);
                j++;
            } else {
                i++;
            }
        }
        
        return result;
    }
};
