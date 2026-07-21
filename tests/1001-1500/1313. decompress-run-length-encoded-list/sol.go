func decompressRLElist(nums []int) []int {
    a := []int{}
    for i := 0; i < len(nums); i += 2 {
        freq := nums[i]
        val := nums[i+1]
        for j := 0; j < freq; j++ {
            a = append(a, val)
        }
    }
    return a
}
