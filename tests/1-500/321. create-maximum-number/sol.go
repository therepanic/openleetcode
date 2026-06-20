func maxNumber(nums1 []int, nums2 []int, k int) []int {
    ans := []int{}
    m, n := len(nums1), len(nums2)
    start := max(0, k - n)
    end := min(m, k)
    for i := start; i <= end; i++ {
        sub1 := getMaxSubsequence(nums1, i)
        sub2 := getMaxSubsequence(nums2, k - i)
        merged := merge(sub1, sub2)
        if greater(merged, ans) {
            ans = merged
        }
    }
    return ans
}

func getMaxSubsequence(nums []int, q int) []int {
    stack := []int{}
    if q == 0 {
        return stack
    }
    maxDrop := len(nums) - q
    for _, num := range nums {
        for maxDrop > 0 && len(stack) > 0 && stack[len(stack)-1] < num {
            stack = stack[:len(stack)-1]
            maxDrop--
        }
        if len(stack) < q {
            stack = append(stack, num)
        } else {
            maxDrop--
        }
    }
    return stack
}

func merge(a, b []int) []int {
    output := make([]int, 0, len(a)+len(b))
    i, j := 0, 0
    for i < len(a) || j < len(b) {
        if greater(a[i:], b[j:]) {
            output = append(output, a[i])
            i++
        } else {
            output = append(output, b[j])
            j++
        }
    }
    return output
}

func greater(a, b []int) bool {
    i, j := 0, 0
    for i < len(a) && j < len(b) && a[i] == b[j] {
        i++
        j++
    }
    if j == len(b) {
        return true
    }
    if i < len(a) && a[i] > b[j] {
        return true
    }
    return false
}
