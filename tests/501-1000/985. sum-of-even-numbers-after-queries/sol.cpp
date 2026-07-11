class Solution {
public:
    vector<int> sumEvenAfterQueries(vector<int>& nums, vector<vector<int>>& queries) {
        int total = 0;
        for (int x : nums) {
            if (x % 2 == 0) total += x;
        }
        vector<int> ans;
        for (auto& q : queries) {
            int val = q[0];
            int idx = q[1];
            if (nums[idx] % 2 == 0) total -= nums[idx];
            nums[idx] += val;
            if (nums[idx] % 2 == 0) total += nums[idx];
            ans.push_back(total);
        }
        return ans;
    }
};
