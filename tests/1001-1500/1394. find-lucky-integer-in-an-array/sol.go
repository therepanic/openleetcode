func findLucky(arr []int) int {
    freq := make(map[int]int)
    for _, num := range arr {
        freq[num]++
    }
    
    lucky := -1
    for num, count := range freq {
        if num == count {
            if num > lucky {
                lucky = num
            }
        }
    }
    
    return lucky
}
