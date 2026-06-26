func findPairs(nums []int, k int) int {
    if k < 0 {
        return 0
    }
    count := 0
    numCounts := make(map[int]int)
    for _, num := range nums {
        numCounts[num]++
    }
    for num, freq := range numCounts {
        if k == 0 {
            if freq >= 2 {
                count++
            }
        } else {
            if _, ok := numCounts[num+k]; ok {
                count++
            }
        }
    }
    return count
}
