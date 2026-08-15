class Solution {
public:
    int maximumUniqueSubarray(vector<int>& nums) {
        int res = 0;
        int cur_sum = 0;
        int start = 0;
        const int k = 10001;
        vector<bool> is_present(k, false);

        for (int end = 0; end < nums.size(); end++) {
            while (is_present[nums[end]]) {
                is_present[nums[start]] = false;
                cur_sum -= nums[start];
                start++;
            }

            is_present[nums[end]] = true;
            cur_sum += nums[end];

            res = max(res, cur_sum);
        }

        return res;
    }
};
