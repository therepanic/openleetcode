class Solution {
public:
    int maxFrequency(vector<int>& nums, int k) {
        sort(nums.begin(), nums.end());
        int left = 0, right = 0, res = 0;
        long long total = 0;

        while (right < nums.size()) {
            total += nums[right];

            while ((long long)nums[right] * (right - left + 1) > total + k) {
                total -= nums[left];
                left++;
            }
            
            res = max(res, right - left + 1);
            right++;
        }
        
        return res;
    }
};
