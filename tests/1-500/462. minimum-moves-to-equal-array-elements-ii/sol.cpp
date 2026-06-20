class Solution {
public:
    long long minMoves2(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        long long moves = 0;
        int left = 0;
        int right = static_cast<int>(nums.size()) - 1;
        while (left < right) {
            moves += static_cast<long long>(nums[right]) - nums[left];
            ++left;
            --right;
        }
        return moves;
    }
};
