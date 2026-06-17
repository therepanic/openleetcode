class Solution {
  bool containsNearbyAlmostDuplicate(List<int> nums, int indexDiff, int valueDiff) {
    if (indexDiff <= 0 || valueDiff < 0) {
      return false;
    }

    int width = valueDiff + 1;
    Map<int, int> buckets = {};

    for (int i = 0; i < nums.length; i++) {
      int x = nums[i];
      int bid = x < 0 ? (x + 1) ~/ width - 1 : x ~/ width;

      if (buckets.containsKey(bid)) {
        return true;
      }

      if (buckets.containsKey(bid - 1) && (x - buckets[bid - 1]!).abs() <= valueDiff) {
        return true;
      }
      if (buckets.containsKey(bid + 1) && (x - buckets[bid + 1]!).abs() <= valueDiff) {
        return true;
      }

      buckets[bid] = x;

      if (i >= indexDiff) {
        int old = nums[i - indexDiff];
        int oldBid = old < 0 ? (old + 1) ~/ width - 1 : old ~/ width;
        buckets.remove(oldBid);
      }
    }

    return false;
  }
}
