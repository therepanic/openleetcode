class Solution {
public:
    int movesToMakeZigzag(vector<int>& nums) {
        int n = nums.size();
        
        auto findValleys = [&](int mode) {
            int res = 0;
            for (int i = 0; i < n; i++) {
                if (i % 2 == mode) {
                    int left = i - 1 >= 0 ? nums[i - 1] : INT_MAX;
                    int right = i + 1 < n ? nums[i + 1] : INT_MAX;
                    int minNeighbor = min(left, right);
                    if (nums[i] >= minNeighbor) {
                        res += nums[i] - (minNeighbor - 1);
                    }
                }
            }
            return res;
        };
        
        return min(findValleys(0), findValleys(1));
    }
};
