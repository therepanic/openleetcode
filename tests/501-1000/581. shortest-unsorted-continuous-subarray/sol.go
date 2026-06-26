import (
	"sort"
)

func findUnsortedSubarray(nums []int) int {
    n := len(nums)
    sortedNums := make([]int, n)
    copy(sortedNums, nums)
    sort.Ints(sortedNums)
    start, end := n, 0

    for i := 0; i < n; i++ {
        if nums[i] != sortedNums[i] {
            if i < start {
                start = i
            }
            if i > end {
                end = i
            }
        }
    }

    if end-start >= 0 {
        return end - start + 1
    }
    return 0
}
