func splitArray(nums []int, k int) int {
    helper := func(perK int) bool {
        count := 1
        currSum := 0
        for _, num := range nums {
            if currSum+num > perK {
                count++
                currSum = num
            } else {
                currSum += num
            }
        }
        return count <= k
    }

    high := 0
    low := 0
    for _, num := range nums {
        high += num
        if num > low {
            low = num
        }
    }
    soln := 0
    for low <= high {
        mid := low + (high-low)/2
        if helper(mid) {
            soln = mid
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return soln
}
