class Solution {
public:
    int jump(vector<int>& nums) {
        int n = (int)nums.size();
        if (n <= 1) return 0;

        int jumps = 0;
        int currEnd = 0;
        int maxReach = 0;

        for (int i = 0; i < n - 1; i++) {
            maxReach = max(maxReach, i + nums[i]);
            if (i == currEnd) {
                jumps++;
                currEnd = maxReach;
                if (currEnd >= n - 1) break;
            }
        }

        return jumps;
    }
};
