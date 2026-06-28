func findShortestSubArray(nums []int) int {
    left := make(map[int]int)
    right := make(map[int]int)
    count := make(map[int]int)
    
    for i, x := range nums {
        if _, ok := left[x]; !ok {
            left[x] = i
        }
        right[x] = i
        count[x]++
    }
    
    ans := len(nums)
    degree := 0
    for _, c := range count {
        if c > degree {
            degree = c
        }
    }
    
    for x, c := range count {
        if c == degree {
            length := right[x] - left[x] + 1
            if length < ans {
                ans = length
            }
        }
    }
    
    return ans
}
