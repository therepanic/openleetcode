class Solution {
    public int countRangeSum(int[] nums, int lower, int upper) {
        long[] psum = new long[nums.length + 1];
        psum[0] = 0;
        for (int i = 0; i < nums.length; i++) {
            psum[i + 1] = psum[i] + nums[i];
        }

        List<Long> slist = new ArrayList<>();
        int result = 0;
        for (int i = psum.length - 1; i >= 0; i--) {
            long pval = psum[i];
            long lo = pval + lower;
            long hi = pval + upper;

            int left = bisectLeft(slist, lo);
            int right = bisectRight(slist, hi);
            result += right - left;

            int idx = bisectLeft(slist, pval);
            slist.add(idx, pval);
        }

        return result;
    }

    private int bisectLeft(List<Long> list, long target) {
        int lo = 0, hi = list.size();
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (list.get(mid) < target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }

    private int bisectRight(List<Long> list, long target) {
        int lo = 0, hi = list.size();
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (list.get(mid) <= target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}
