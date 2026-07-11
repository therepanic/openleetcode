class Solution {
public:
    int largestPerimeter(vector<int>& nums) {
        int minVal = *min_element(nums.begin(), nums.end());
        int maxVal = *max_element(nums.begin(), nums.end());

        vector<int> freq(maxVal - minVal + 1, 0);
        for (int x : nums) {
            freq[x - minVal]++;
        }

        int idx = 0;
        for (int v = maxVal; v >= minVal; v--) {
            while (freq[v - minVal] > 0) {
                nums[idx] = v;
                idx++;
                freq[v - minVal]--;
            }
        }

        for (int i = 0; i < nums.size() - 2; i++) {
            if (nums[i + 1] + nums[i + 2] > nums[i]) {
                return nums[i] + nums[i + 1] + nums[i + 2];
            }
        }
        return 0;
    }
};
