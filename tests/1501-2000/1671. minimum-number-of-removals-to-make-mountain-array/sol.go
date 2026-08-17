func minimumMountainRemovals(nums []int) int {
    n := len(nums)
    lis := make([]int, n)
    lds := make([]int, n)
    for i := range lis {
        lis[i] = 1
        lds[i] = 1
    }

    for i := 0; i < n; i++ {
        for j := 0; j < i; j++ {
            if nums[i] > nums[j] {
                if lis[j] + 1 > lis[i] {
                    lis[i] = lis[j] + 1
                }
            }
        }
    }

    for i := n - 1; i >= 0; i-- {
        for j := n - 1; j > i; j-- {
            if nums[i] > nums[j] {
                if lds[j] + 1 > lds[i] {
                    lds[i] = lds[j] + 1
                }
            }
        }
    }

    maxLen := 0
    for i := 1; i < n-1; i++ {
        if lis[i] > 1 && lds[i] > 1 {
            if lis[i] + lds[i] - 1 > maxLen {
                maxLen = lis[i] + lds[i] - 1
            }
        }
    }

    return n - maxLen
}
