class Solution {
private:
    int bound(vector<int>& nums, int target, bool left) {
        int low = 0;
        int high = (int)nums.size() - 1;
        int ans = -1;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            if (nums[mid] < target) {
                low = mid + 1;
            } else if (nums[mid] > target) {
                high = mid - 1;
            } else {
                ans = mid;
                if (left) {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                }
            }
        }

        return ans;
    }

public:
    vector<int> searchRange(vector<int>& nums, int target) {
        return {bound(nums, target, true), bound(nums, target, false)};
    }
};
