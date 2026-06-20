func reversePairs(nums []int) int {
    var sortCount func([]int) ([]int, int)
    sortCount = func(arr []int) ([]int, int) {
        n := len(arr)
        if n <= 1 {
            return arr, 0
        }

        mid := n / 2
        left, leftCount := sortCount(arr[:mid])
        right, rightCount := sortCount(arr[mid:])

        count := leftCount + rightCount

        j := 0
        for _, x := range left {
            for j < len(right) && x > 2*right[j] {
                j++
            }
            count += j
        }

        merged := make([]int, 0, n)
        i, j := 0, 0
        for i < len(left) && j < len(right) {
            if left[i] <= right[j] {
                merged = append(merged, left[i])
                i++
            } else {
                merged = append(merged, right[j])
                j++
            }
        }

        for ; i < len(left); i++ {
            merged = append(merged, left[i])
        }
        for ; j < len(right); j++ {
            merged = append(merged, right[j])
        }

        return merged, count
    }

    _, count := sortCount(nums)
    return count
}
