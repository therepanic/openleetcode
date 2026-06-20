class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ indexDiff: Int, _ valueDiff: Int) -> Bool {
        if indexDiff <= 0 || valueDiff < 0 {
            return false
        }

        let width = valueDiff + 1
        var buckets = [Int: Int]()

        for i in 0..<nums.count {
            let x = nums[i]
            let bid = x < 0 ? (x + 1) / width - 1 : x / width

            if buckets[bid] != nil {
                return true
            }

            if let val = buckets[bid - 1], abs(x - val) <= valueDiff {
                return true
            }
            if let val = buckets[bid + 1], abs(x - val) <= valueDiff {
                return true
            }

            buckets[bid] = x

            if i >= indexDiff {
                let old = nums[i - indexDiff]
                let oldBid = old < 0 ? (old + 1) / width - 1 : old / width
                buckets.removeValue(forKey: oldBid)
            }
        }

        return false
    }
}
