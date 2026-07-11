func isNStraightHand(hand []int, groupSize int) bool {
    hashmap := make(map[int]int)
    for _, h := range hand {
        hashmap[h]++
    }
    
    keys := make([]int, 0, len(hashmap))
    for k := range hashmap {
        keys = append(keys, k)
    }
    sort.Ints(keys)
    minHeap := keys
    idx := 0
    
    for idx < len(minHeap) {
        first := minHeap[idx]
        for i := first; i < first+groupSize; i++ {
            if _, ok := hashmap[i]; !ok {
                return false
            }
            hashmap[i]--
            if hashmap[i] == 0 {
                if i != minHeap[idx] {
                    return false
                }
                idx++
            }
        }
    }
    return true
}
