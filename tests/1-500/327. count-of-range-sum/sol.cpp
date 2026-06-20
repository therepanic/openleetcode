class Solution {
public:
    int countRangeSum(vector<int>& nums, int lower, int upper) {
        vector<long long> prefix(nums.size() + 1, 0);
        for (int i = 0; i < (int)nums.size(); ++i) {
            prefix[i + 1] = prefix[i] + nums[i];
        }
        vector<long long> buffer(prefix.size());
        return (int)countWhileMergeSort(prefix, buffer, 0, (int)prefix.size(), lower, upper);
    }

private:
    long long countWhileMergeSort(vector<long long>& prefix, vector<long long>& buffer, int left, int right, int lower, int upper) {
        if (right - left <= 1) {
            return 0;
        }

        int mid = left + (right - left) / 2;
        long long count = countWhileMergeSort(prefix, buffer, left, mid, lower, upper)
                        + countWhileMergeSort(prefix, buffer, mid, right, lower, upper);

        int low = mid;
        int high = mid;
        for (int i = left; i < mid; ++i) {
            while (low < right && prefix[low] - prefix[i] < lower) {
                ++low;
            }
            while (high < right && prefix[high] - prefix[i] <= upper) {
                ++high;
            }
            count += high - low;
        }

        int i = left;
        int j = mid;
        int idx = left;
        while (i < mid && j < right) {
            if (prefix[i] <= prefix[j]) {
                buffer[idx++] = prefix[i++];
            } else {
                buffer[idx++] = prefix[j++];
            }
        }
        while (i < mid) {
            buffer[idx++] = prefix[i++];
        }
        while (j < right) {
            buffer[idx++] = prefix[j++];
        }
        for (int k = left; k < right; ++k) {
            prefix[k] = buffer[k];
        }

        return count;
    }
};
