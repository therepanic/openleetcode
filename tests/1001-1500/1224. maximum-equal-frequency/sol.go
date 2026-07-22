func maxEqualFreq(nums []int) int {
    counts := make(map[int]int)
    frequencyCounts := make(map[int]int)
    best := 0

    for i, value := range nums {
        index := i + 1
        previous := counts[value]
        if previous > 0 {
            frequencyCounts[previous]--
            if frequencyCounts[previous] == 0 {
                delete(frequencyCounts, previous)
            }
        }
        counts[value] = previous + 1
        frequency := previous + 1
        frequencyCounts[frequency]++

        if len(frequencyCounts) == 1 {
            for onlyFrequency, valueCount := range frequencyCounts {
                if onlyFrequency == 1 || valueCount == 1 {
                    best = index
                }
                break
            }
        } else if len(frequencyCounts) == 2 {
            keys := make([]int, 0, 2)
            for k := range frequencyCounts {
                keys = append(keys, k)
            }
            low, high := keys[0], keys[1]
            if low > high {
                low, high = high, low
            }
            if (low == 1 && frequencyCounts[low] == 1) || (high == low+1 && frequencyCounts[high] == 1) {
                best = index
            }
        }
    }

    return best
}
