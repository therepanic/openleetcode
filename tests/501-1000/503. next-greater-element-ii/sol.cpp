class Solution {
public:
    vector<int> nextGreaterElements(vector<int>& nums) {
        int n = nums.size();
        vector<int> res(n, -1);
        for (int i = 0; i < n; ++i) {
            for (int j = i + 1; j < n; ++j) {
                if (nums[j] > nums[i]) {
                    res[i] = nums[j];
                    break;
                }
            }
            if (res[i] == -1) {
                for (int j = 0; j < i; ++j) {
                    if (nums[j] > nums[i]) {
                        res[i] = nums[j];
                        break;
                    }
                }
            }
        }
        return res;
    }
};
