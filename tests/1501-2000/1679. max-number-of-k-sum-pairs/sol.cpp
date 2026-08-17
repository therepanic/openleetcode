class Solution {
public:
    int maxOperations(vector<int>& nums, int k) {
        sort(nums.begin(), nums.end());
        int i = 0, j = nums.size() - 1;
        int count = 0;

        while (i < j) {
            int total = nums[i] + nums[j];
            if (total == k) {
                count++;
                i++;
                j--;
            } else if (total > k) {
                j--;
            } else {
                i++;
            }
        }

        return count;
    }
};
