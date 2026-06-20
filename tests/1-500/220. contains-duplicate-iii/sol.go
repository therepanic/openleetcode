func containsNearbyAlmostDuplicate(nums []int, indexDiff int, valueDiff int) bool {
    if indexDiff <= 0 || valueDiff < 0 {
        return false
    }

    width := valueDiff + 1
    buckets := make(map[int]int)

    for i, x := range nums {
        bid := x / width
        if x < 0 {
            bid = (x+1)/width - 1
        }

        if _, ok := buckets[bid]; ok {
            return true
        }

        if v, ok := buckets[bid-1]; ok && abs(x-v) <= valueDiff {
            return true
        }
        if v, ok := buckets[bid+1]; ok && abs(x-v) <= valueDiff {
            return true
        }

        buckets[bid] = x

        if i >= indexDiff {
            old := nums[i-indexDiff]
            oldBid := old / width
            if old < 0 {
                oldBid = (old+1)/width - 1
            }
            delete(buckets, oldBid)
        }
    }

    return false
}

func abs(a int) int {
    if a < 0 {
        return -a
    }
    return a
}
