func countQuadruplets(nums []int) int {
    res := 0
    n := len(nums)
    for w := 0; w < n; w++ {
        for x := w + 1; x < n; x++ {
            for y := x + 1; y < n; y++ {
                for z := y + 1; z < n; z++ {
                    if nums[w] + nums[x] + nums[y] == nums[z] {
                        res++
                    }
                }
            }
        }
    }
    return res
}
