class Solution {
public:
    int countQuadruplets(vector<int>& nums) {
        int res = 0, n = nums.size();
        for (int w = 0; w < n; w++) {
            for (int x = w + 1; x < n; x++) {
                for (int y = x + 1; y < n; y++) {
                    for (int z = y + 1; z < n; z++) {
                        res += (nums[w] + nums[x] + nums[y] == nums[z]);
                    }
                }
            }
        }
        return res;
    }
};
