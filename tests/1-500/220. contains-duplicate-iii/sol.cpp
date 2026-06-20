class Solution {
public:
    bool containsNearbyAlmostDuplicate(vector<int>& nums, int indexDiff, int valueDiff) {
        if (indexDiff <= 0 || valueDiff < 0) {
            return false;
        }

        long long width = (long long)valueDiff + 1;
        unordered_map<long long, long long> buckets;

        for (int i = 0; i < nums.size(); i++) {
            long long x = nums[i];
            long long bid = x < 0 ? (x + 1) / width - 1 : x / width;

            if (buckets.count(bid)) {
                return true;
            }

            if (buckets.count(bid - 1) && abs(x - buckets[bid - 1]) <= valueDiff) {
                return true;
            }
            if (buckets.count(bid + 1) && abs(x - buckets[bid + 1]) <= valueDiff) {
                return true;
            }

            buckets[bid] = x;

            if (i >= indexDiff) {
                long long old = nums[i - indexDiff];
                long long oldBid = old < 0 ? (old + 1) / width - 1 : old / width;
                buckets.erase(oldBid);
            }
        }

        return false;
    }
};
