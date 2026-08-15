class Solution {
public:
    int maxAbsoluteSum(vector<int>& nums) {
        int prefix_sum = 0;
        int min_prefix_sum = 0;
        int max_prefix_sum = 0;
        int max_absolute_sum = 0;

        for (int num : nums) {
            prefix_sum += num;
            
            max_absolute_sum = max(max_absolute_sum, abs(prefix_sum - min_prefix_sum));
            max_absolute_sum = max(max_absolute_sum, abs(prefix_sum - max_prefix_sum));
            
            min_prefix_sum = min(min_prefix_sum, prefix_sum);
            max_prefix_sum = max(max_prefix_sum, prefix_sum);
        }

        return max_absolute_sum;
    }
};
