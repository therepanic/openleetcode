func movesToMakeZigzag(nums []int) int {
    n := len(nums)
    findValleys := func(mode int) int {
        res := 0
        for i := 0; i < n; i++ {
            if i % 2 == mode {
                left := int(^uint(0) >> 1) // max int
                if i - 1 >= 0 {
                    left = nums[i - 1]
                }
                right := int(^uint(0) >> 1)
                if i + 1 < n {
                    right = nums[i + 1]
                }
                minNeighbor := left
                if right < minNeighbor {
                    minNeighbor = right
                }
                if nums[i] >= minNeighbor {
                    res += nums[i] - (minNeighbor - 1)
                }
            }
        }
        return res
    }
    
    a := findValleys(0)
    b := findValleys(1)
    if a < b {
        return a
    }
    return b
}
