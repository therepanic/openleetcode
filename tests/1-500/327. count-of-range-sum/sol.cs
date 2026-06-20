public class Solution {
    public int CountRangeSum(int[] nums, int lower, int upper) {
        long[] prefix = new long[nums.Length + 1];
        for (int i = 0; i < nums.Length; i++) {
            prefix[i + 1] = prefix[i] + nums[i];
        }

        long[] buffer = new long[prefix.Length];
        long count = CountWhileMergeSort(prefix, buffer, 0, prefix.Length, lower, upper);
        return (int)count;
    }

    private long CountWhileMergeSort(long[] prefix, long[] buffer, int left, int right, int lower, int upper) {
        if (right - left <= 1) {
            return 0;
        }

        int mid = left + (right - left) / 2;
        long count = CountWhileMergeSort(prefix, buffer, left, mid, lower, upper)
                   + CountWhileMergeSort(prefix, buffer, mid, right, lower, upper);

        int low = mid;
        int high = mid;
        for (int i = left; i < mid; i++) {
            while (low < right && prefix[low] - prefix[i] < lower) {
                low++;
            }
            while (high < right && prefix[high] - prefix[i] <= upper) {
                high++;
            }
            count += high - low;
        }

        int p1 = left;
        int p2 = mid;
        int idx = left;
        while (p1 < mid && p2 < right) {
            if (prefix[p1] <= prefix[p2]) {
                buffer[idx++] = prefix[p1++];
            } else {
                buffer[idx++] = prefix[p2++];
            }
        }
        while (p1 < mid) {
            buffer[idx++] = prefix[p1++];
        }
        while (p2 < right) {
            buffer[idx++] = prefix[p2++];
        }
        for (int i = left; i < right; i++) {
            prefix[i] = buffer[i];
        }

        return count;
    }
}
