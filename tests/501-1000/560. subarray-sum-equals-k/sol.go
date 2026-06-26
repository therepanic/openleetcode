func subarraySum(nums []int, k int) int {
    subNum := map[int]int{0: 1}
    total := 0
    count := 0
    
    for _, n := range nums {
        total += n
        
        if val, ok := subNum[total - k]; ok {
            count += val
        }
        
        subNum[total]++
    }
    
    return count
}
