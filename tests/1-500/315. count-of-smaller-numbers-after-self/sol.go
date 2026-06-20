func countSmaller(nums []int) []int {
    var sortedList []int
    ans := make([]int, 0, len(nums))
    for i := len(nums) - 1; i >= 0; i-- {
        n := nums[i]
        idx := bisectLeft(sortedList, n)
        ans = append(ans, idx)
        sortedList = insert(sortedList, idx, n)
    }
    for i, j := 0, len(ans)-1; i < j; i, j = i+1, j-1 {
        ans[i], ans[j] = ans[j], ans[i]
    }
    return ans
}

func bisectLeft(list []int, target int) int {
    lo, hi := 0, len(list)
    for lo < hi {
        mid := lo + (hi-lo)/2
        if list[mid] >= target {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    return lo
}

func insert(list []int, idx, val int) []int {
    list = append(list, 0)
    copy(list[idx+1:], list[idx:])
    list[idx] = val
    return list
}
