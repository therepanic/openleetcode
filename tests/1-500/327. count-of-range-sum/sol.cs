public class Solution {
    public int CountRangeSum(int[] nums, int lower, int upper) {
        long[] psum = new long[nums.Length + 1];
        psum[0] = 0;
        for (int i = 0; i < nums.Length; i++) {
            psum[i + 1] = psum[i] + nums[i];
        }

        List<long> slist = new List<long>();
        int result = 0;
        for (int i = psum.Length - 1; i >= 0; i--) {
            long pval = psum[i];
            long lo = pval + lower;
            long hi = pval + upper;

            int left = BisectLeft(slist, lo);
            int right = BisectRight(slist, hi);
            result += right - left;

            int idx = BisectLeft(slist, pval);
            slist.Insert(idx, pval);
        }

        return result;
    }

    private int BisectLeft(List<long> list, long target) {
        int lo = 0, hi = list.Count;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (list[mid] < target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }

    private int BisectRight(List<long> list, long target) {
        int lo = 0, hi = list.Count;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (list[mid] <= target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}
