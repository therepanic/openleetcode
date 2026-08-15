func numOfSubarrays(arr []int) int {
    oddCount := int64(0)
    prefixSum := int64(0)
    const mod = 1000000007
    for _, a := range arr {
        prefixSum += int64(a)
        oddCount += prefixSum % 2
    }
    oddCount += (int64(len(arr)) - oddCount) * oddCount
    return int(oddCount % mod)
}
