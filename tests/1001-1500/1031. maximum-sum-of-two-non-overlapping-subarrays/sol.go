func maxSumTwoNoOverlap(nums []int, firstLen int, secondLen int) int {
    return max(solve1031(nums, firstLen, secondLen), solve1031(nums, secondLen, firstLen))
}

func solve1031(nums []int, firstLen int, secondLen int) int {
    n := len(nums)
    prefix := make([]int, n+1)
    for i := 0; i < n; i++ {
        prefix[i+1] = prefix[i] + nums[i]
    }
    bestA := prefix[firstLen]
    ans := 0
    for end := firstLen + secondLen; end <= n; end++ {
        bestA = max(bestA, prefix[end-secondLen]-prefix[end-secondLen-firstLen])
        ans = max(ans, bestA+prefix[end]-prefix[end-secondLen])
    }
    return ans
}
