func smallestDivisor(nums []int, threshold int) int {
    low := 1
    high := 0
    for _, num := range nums {
        if num > high {
            high = num
        }
    }
    ans := high

    for low <= high {
        mid := low + (high - low) / 2

        total := 0
        for _, num := range nums {
            total += (num + mid - 1) / mid
        }

        if total <= threshold {
            ans = mid
            high = mid - 1
        } else {
            low = mid + 1
        }
    }

    return ans
}
