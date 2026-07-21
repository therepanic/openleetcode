class Solution {
public:
    bool kLengthApart(vector<int>& nums, int k) {
        if (k == 0) {
            return true;
        }
        int prev = -1;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] == 1) {
                if (prev != -1 && i - prev <= k) {
                    return false;
                }
                prev = i;
            }
        }
        return true;
    }
};
