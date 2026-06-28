func smallestDistancePair(nums []int, k int) int {
    sort.Ints(nums)
    n := len(nums)
    low, high := 0, nums[n-1]-nums[0]

    for low < high {
        mid := low + (high-low)/2
        count := 0
        j := 0
        for i := 0; i < n; i++ {
            for j < n && nums[j]-nums[i] <= mid {
                j++
            }
            count += j - i - 1
        }
        if count < k {
            low = mid + 1
        } else {
            high = mid
        }
    }
    return low
}
