func maximumUniqueSubarray(nums []int) int {
    res := 0
    curSum := 0
    start := 0
    k := 10001
    isPresent := make([]bool, k)

    for end := 0; end < len(nums); end++ {
        for isPresent[nums[end]] {
            isPresent[nums[start]] = false
            curSum -= nums[start]
            start++
        }

        isPresent[nums[end]] = true
        curSum += nums[end]

        if curSum > res {
            res = curSum
        }
    }

    return res
}
