class Solution {
    fun containsNearbyAlmostDuplicate(nums: IntArray, indexDiff: Int, valueDiff: Int): Boolean {
        if (indexDiff <= 0 || valueDiff < 0) {
            return false
        }

        val width = valueDiff.toLong() + 1
        val buckets = mutableMapOf<Long, Long>()

        for (i in nums.indices) {
            val x = nums[i].toLong()
            val bid = if (x < 0) (x + 1) / width - 1 else x / width

            if (buckets.containsKey(bid)) {
                return true
            }

            buckets[bid - 1]?.let { if (Math.abs(x - it) <= valueDiff) return true }
            buckets[bid + 1]?.let { if (Math.abs(x - it) <= valueDiff) return true }

            buckets[bid] = x

            if (i >= indexDiff) {
                val old = nums[i - indexDiff].toLong()
                val oldBid = if (old < 0) (old + 1) / width - 1 else old / width
                buckets.remove(oldBid)
            }
        }

        return false
    }
}
