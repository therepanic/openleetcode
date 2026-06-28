func reorganizeString(s string) string {
    charFreq := make(map[rune]int)
    for _, c := range s {
        charFreq[c]++
    }
    
    maxHeap := make([][]int, 0)
    for char, freq := range charFreq {
        maxHeap = append(maxHeap, []int{freq, int(char)})
    }
    
    sort.Slice(maxHeap, func(i, j int) bool {
        return maxHeap[i][0] > maxHeap[j][0]
    })
    
    res := make([]byte, 0, len(s))
    var prevFreq, prevChar int
    
    for len(maxHeap) > 0 {
        freq, char := maxHeap[0][0], maxHeap[0][1]
        maxHeap = maxHeap[1:]
        
        res = append(res, byte(char))
        
        if prevFreq > 0 {
            maxHeap = append(maxHeap, []int{prevFreq, prevChar})
            sort.Slice(maxHeap, func(i, j int) bool {
                return maxHeap[i][0] > maxHeap[j][0]
            })
        }
        
        prevFreq = freq - 1
        prevChar = char
    }
    
    if len(res) != len(s) {
        return ""
    }
    
    return string(res)
}
