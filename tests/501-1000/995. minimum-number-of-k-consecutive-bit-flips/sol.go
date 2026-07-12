func minKBitFlips(nums []int, k int) int {
    n := len(nums)
    ans := 0
    flips := 0
    flipped := make([]int, n+1)

    for i := 0; i <= n-k; i++ {
        flips += flipped[i]
        if (nums[i] == 0 && flips%2 == 0) || (nums[i] == 1 && flips%2 != 0) {
            flips++
            ans++
            flipped[i+k]--
        }
    }

    for i := n - k + 1; i < n; i++ {
        flips += flipped[i]
        if (nums[i] == 0 && flips%2 == 0) || (nums[i] == 1 && flips%2 != 0) {
            return -1
        }
    }

    return ans
}
