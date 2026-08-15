class Solution {
public:
    vector<int> mostCompetitive(vector<int>& nums, int k) {
        vector<int> stack;
        int n = nums.size();
        for (int i = 0; i < n; i++) {
            while (!stack.empty() && stack.back() > nums[i]) {
                if (n - 1 - i >= k - (int)stack.size()) {
                    stack.pop_back();
                } else {
                    break;
                }
            }
            stack.push_back(nums[i]);
        }
        return vector<int>(stack.begin(), stack.begin() + k);
    }
};
