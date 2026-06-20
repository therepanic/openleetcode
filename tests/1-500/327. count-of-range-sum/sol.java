class Solution {
    public int countRangeSum(int[] nums, int lower, int upper) {
        long[] prefix = new long[nums.length + 1];
        for (int i = 0; i < nums.length; i++) {
            prefix[i + 1] = prefix[i] + nums[i];
        }

        long[] buffer = new long[prefix.length];
        long count = countWhileMergeSort(prefix, buffer, 0, prefix.length, lower, upper);
        return (int)count;
    }

    private long countWhileMergeSort(long[] prefix, long[] buffer, int left, int right, int lower, int upper) {
        if (right - left <= 1) {
            return 0L;
        }

        int mid = left + (right - left) / 2;
        long count = countWhileMergeSort(prefix, buffer, left, mid, lower, upper)
                   + countWhileMergeSort(prefix, buffer, mid, right, lower, upper);

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
        System.arraycopy(buffer, left, prefix, left, right - left);

        return count;
    }
}
