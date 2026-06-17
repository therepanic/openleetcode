class Solution:
    def containsNearbyAlmostDuplicate(self, nums: List[int], indexDiff: int, valueDiff: int) -> bool:
        if indexDiff <= 0 or valueDiff < 0:
            return False

        # Bucket width: if two numbers are within valueDiff, they must be in
        # the same bucket or neighboring buckets.
        width = valueDiff + 1
        buckets = {}

        def bucket_id(x: int) -> int:
            # Python handles negative // well for our bucket mapping.
            return x // width

        for i, x in enumerate(nums):
            bid = bucket_id(x)

            # Same bucket => definitely within valueDiff.
            if bid in buckets:
                return True

            # Neighbor buckets may still be close enough; check exact difference.
            if bid - 1 in buckets and abs(x - buckets[bid - 1]) <= valueDiff:
                return True
            if bid + 1 in buckets and abs(x - buckets[bid + 1]) <= valueDiff:
                return True

            buckets[bid] = x

            # Keep only last indexDiff elements in window.
            if i >= indexDiff:
                old = nums[i - indexDiff]
                del buckets[bucket_id(old)]

        return False