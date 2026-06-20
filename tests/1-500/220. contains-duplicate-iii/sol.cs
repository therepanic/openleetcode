public class Solution {
    public bool ContainsNearbyAlmostDuplicate(int[] nums, int indexDiff, int valueDiff) {
        if (indexDiff <= 0 || valueDiff < 0) {
            return false;
        }

        long width = (long)valueDiff + 1;
        Dictionary<long, long> buckets = new Dictionary<long, long>();

        for (int i = 0; i < nums.Length; i++) {
            long x = nums[i];
            long bid = x < 0 ? (x + 1) / width - 1 : x / width;

            if (buckets.ContainsKey(bid)) {
                return true;
            }

            if (buckets.ContainsKey(bid - 1) && Math.Abs(x - buckets[bid - 1]) <= valueDiff) {
                return true;
            }
            if (buckets.ContainsKey(bid + 1) && Math.Abs(x - buckets[bid + 1]) <= valueDiff) {
                return true;
            }

            buckets[bid] = x;

            if (i >= indexDiff) {
                long old = nums[i - indexDiff];
                long oldBid = old < 0 ? (old + 1) / width - 1 : old / width;
                buckets.Remove(oldBid);
            }
        }

        return false;
    }
}
