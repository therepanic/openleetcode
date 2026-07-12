func totalFruit(fruits []int) int {
    start := 0
    maxLen := 0
    fruitCount := make(map[int]int)
    
    for end := 0; end < len(fruits); end++ {
        fruitCount[fruits[end]]++
        
        for len(fruitCount) > 2 {
            leftFruit := fruits[start]
            fruitCount[leftFruit]--
            if fruitCount[leftFruit] == 0 {
                delete(fruitCount, leftFruit)
            }
            start++
        }
        
        if end-start+1 > maxLen {
            maxLen = end - start + 1
        }
    }
    
    return maxLen
}
