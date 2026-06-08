class Solution {
public:
    bool canJump(vector<int>& nums) {
        int farthest = 0;
        for (int i = 0; i < static_cast<int>(nums.size()); i++) {
            if (i > farthest) {
                return false;
            }
            farthest = max(farthest, i + nums[i]);
            if (farthest >= static_cast<int>(nums.size()) - 1) {
                return true;
            }
        }
        return true;
    }
};
