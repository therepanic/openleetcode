func minAbsDifference(nums []int, goal int) int {
    sums := func(values []int) []int {
        result := []int{0}
        for _, value := range values {
            currentLen := len(result)
            for i := 0; i < currentLen; i++ {
                result = append(result, result[i]+value)
            }
        }
        return result
    }
    mid := len(nums) / 2
    left := sums(nums[:mid])
    right := sums(nums[mid:])
    sort.Ints(left)
    sort.Ints(right)
    answer := abs(goal)
    j := len(right) - 1
    for _, value := range left {
        for j > 0 && right[j-1] >= goal-value {
            j--
        }
        answer = min(answer, abs(value+right[j]-goal))
        if j > 0 {
            answer = min(answer, abs(value+right[j-1]-goal))
        }
    }
    return answer
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
