func findOriginalArray(changed []int) []int {
    if len(changed)%2 != 0 {
        return []int{}
    }
    
    count := make(map[int]int)
    for _, num := range changed {
        count[num]++
    }
    sort.Ints(changed)
    original := []int{}
    
    for _, num := range changed {
        if count[num] == 0 {
            continue
        }
        if count[2*num] == 0 {
            return []int{}
        }
        original = append(original, num)
        count[num]--
        count[2*num]--
    }
    
    return original
}
