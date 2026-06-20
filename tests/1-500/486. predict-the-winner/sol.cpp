class Solution {
public:
    bool predictTheWinner(vector<int>& nums) {
        function<int(int, int)> helper = [&](int left, int right) -> int {
            if (left == right) {
                return nums[left];
            }
            return max(nums[left] - helper(left + 1, right), 
                      nums[right] - helper(left, right - 1));
        };
        return helper(0, nums.size() - 1) >= 0;
    }
};
