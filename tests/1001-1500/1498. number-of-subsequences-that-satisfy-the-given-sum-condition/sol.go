func numSubseq(nums []int, target int) int {
    mod := 1000000007
    sort.Ints(nums)
    n := len(nums)

    power := make([]int, n)
    power[0] = 1
    for i := 1; i < n; i++ {
        power[i] = (power[i-1] * 2) % mod
    }

    left, right := 0, n-1
    result := 0

    for left <= right {
        if nums[left]+nums[right] <= target {
            result = (result + power[right-left]) % mod
            left++
        } else {
            right--
        }
    }

    return result
}
