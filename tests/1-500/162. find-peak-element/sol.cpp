class Solution {
public:
    int findPeakElement(vector<int>& nums) {
        int n = nums.size();
        if (n < 3) {
            return nums[0] >= nums[n - 1] ? 0 : n - 1;
        }
        int left = 0, right = nums.size() - 1;
        while (left < right) {
            int mid = left + (right - left) / 2;
            if (mid > 0 && mid < n - 1 && nums[mid - 1] < nums[mid] && nums[mid] > nums[mid + 1]) {
                return mid;
            }
            if (nums[mid] < nums[mid + 1]) left = mid + 1;
            else right = mid;
        }
        return left;
    }
};
