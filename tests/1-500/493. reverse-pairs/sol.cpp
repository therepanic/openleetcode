class Solution {
public:
    int reversePairs(vector<int>& nums) {
        return sortCount(nums, 0, nums.size() - 1);
    }

private:
    int sortCount(vector<int>& nums, int left, int right) {
        if (left >= right) {
            return 0;
        }
        int mid = left + (right - left) / 2;
        int count = sortCount(nums, left, mid) + sortCount(nums, mid + 1, right);

        int j = mid + 1;
        for (int i = left; i <= mid; i++) {
            while (j <= right && (long long)nums[i] > 2LL * nums[j]) {
                j++;
            }
            count += j - (mid + 1);
        }

        inplace_merge(nums.begin() + left, nums.begin() + mid + 1, nums.begin() + right + 1);
        return count;
    }
};
