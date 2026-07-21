func numOfSubarrays(arr []int, k int, threshold int) int {
    res := 0
    left := 0
    total := 0
    for right := 0; right < len(arr); right++ {
        total += arr[right]
        if right - left + 1 == k {
            if total / k >= threshold {
                res++
            }
            total -= arr[left]
            left++
        }
    }
    return res
}
