class Solution {
    public boolean containsNearbyAlmostDuplicate(int[] nums, int indexDiff, int valueDiff) {
        if (indexDiff <= 0 || valueDiff < 0) {
            return false;
        }

        long width = (long) valueDiff + 1;
        Map<Long, Long> buckets = new HashMap<>();

        for (int i = 0; i < nums.length; i++) {
            long x = nums[i];
            long bid = x < 0 ? (x + 1) / width - 1 : x / width;

            if (buckets.containsKey(bid)) {
                return true;
            }

            if (buckets.containsKey(bid - 1) && Math.abs(x - buckets.get(bid - 1)) <= valueDiff) {
                return true;
            }
            if (buckets.containsKey(bid + 1) && Math.abs(x - buckets.get(bid + 1)) <= valueDiff) {
                return true;
            }

            buckets.put(bid, x);

            if (i >= indexDiff) {
                long old = nums[i - indexDiff];
                long oldBid = old < 0 ? (old + 1) / width - 1 : old / width;
                buckets.remove(oldBid);
            }
        }

        return false;
    }
}
