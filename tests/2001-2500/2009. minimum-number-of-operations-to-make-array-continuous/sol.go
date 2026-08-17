func minOperations(nums []int) int {
    length := len(nums)
    minOps := length
    uniqueNums := make([]int, 0)
    seen := make(map[int]bool)
    for _, num := range nums {
        if !seen[num] {
            seen[num] = true
            uniqueNums = append(uniqueNums, num)
        }
    }
    sort.Ints(uniqueNums)
    right := 0
    
    for left := 0; left < len(uniqueNums); left++ {
        for right < len(uniqueNums) && uniqueNums[right] < uniqueNums[left] + length {
            right++
        }
        
        if length-(right-left) < minOps {
            minOps = length - (right - left)
        }
    }
    
    return minOps
}
