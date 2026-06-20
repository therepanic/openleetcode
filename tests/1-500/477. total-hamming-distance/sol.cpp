class Solution {
public:
    int totalHammingDistance(vector<int>& nums) {
        int total = 0;
        int n = nums.size();
        for (int i = 0; i < 32; i++) {
            int ones = 0;
            for (int num : nums) {
                ones += (num >> i) & 1;
            }
            total += ones * (n - ones);
        }
        return total;
    }
};
