func countTriplets(arr []int) int {
    totalCount := 0
    prefixXor := 0
    prefixCount := map[int]int{0: 1}
    indexSum := map[int]int{0: 0}
    for k := 1; k <= len(arr); k++ {
        prefixXor ^= arr[k-1]
        if cnt, ok := prefixCount[prefixXor]; ok {
            totalCount += cnt*(k-1) - indexSum[prefixXor]
        } else {
            prefixCount[prefixXor] = 0
            indexSum[prefixXor] = 0
        }
        prefixCount[prefixXor]++
        indexSum[prefixXor] += k
    }
    return totalCount
}
