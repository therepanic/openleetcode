func firstMissingPositive(nums []int) int {
    seen := make(map[int]struct{}, len(nums))
    for _, num := range nums {
        seen[num] = struct{}{}
    }
    i := 1
    for {
        if _, ok := seen[i]; !ok {
            return i
        }
        i++
    }
}
