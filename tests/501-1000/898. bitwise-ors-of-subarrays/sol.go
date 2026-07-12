func subarrayBitwiseORs(arr []int) int {
    resultOrs := make(map[int]bool)
    currentOrs := make(map[int]bool)
    
    for _, x := range arr {
        nextOrs := make(map[int]bool)
        for y := range currentOrs {
            nextOrs[x|y] = true
        }
        nextOrs[x] = true
        
        for val := range nextOrs {
            resultOrs[val] = true
        }
        
        currentOrs = nextOrs
    }
    
    return len(resultOrs)
}
