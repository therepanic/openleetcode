func minMoves2(nums []int) int64 {
    sort.Ints(nums)
    median := nums[len(nums)/2]
    var moves int64
    for _, num := range nums {
        diff := int64(num) - int64(median)
        if diff < 0 {
            diff = -diff
        }
        moves += diff
    }
    return moves
}
