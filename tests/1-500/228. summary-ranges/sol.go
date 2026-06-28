func summaryRanges(nums []int) []string {
    result := []string{}
    i := 0
    
    for i < len(nums) {
        start := nums[i]
        j := i
        for j + 1 < len(nums) && nums[j + 1] == nums[j] + 1 {
            j++
        }
        
        if nums[j] == start {
            result = append(result, strconv.Itoa(start))
        } else {
            result = append(result, strconv.Itoa(start) + "->" + strconv.Itoa(nums[j]))
        }
        
        i = j + 1
    }
    
    return result
}
