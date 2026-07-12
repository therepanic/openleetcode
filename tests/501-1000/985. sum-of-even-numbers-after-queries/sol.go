func sumEvenAfterQueries(nums []int, queries [][]int) []int {
    total := 0
    for _, x := range nums {
        if x % 2 == 0 {
            total += x
        }
    }
    ans := make([]int, len(queries))
    for i, q := range queries {
        val, idx := q[0], q[1]
        if nums[idx] % 2 == 0 {
            total -= nums[idx]
        }
        nums[idx] += val
        if nums[idx] % 2 == 0 {
            total += nums[idx]
        }
        ans[i] = total
    }
    return ans
}
