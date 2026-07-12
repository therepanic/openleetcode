func binaryGap(n int) int {
    maxDist := 0
    currDist := 0
    foundFirstOne := false
    
    for n > 0 {
        bit := n % 2
        
        if bit == 1 {
            if foundFirstOne {
                if currDist > maxDist {
                    maxDist = currDist
                }
            }
            
            currDist = 1
            foundFirstOne = true
        } else {
            if foundFirstOne {
                currDist++
            }
        }
        
        n /= 2
    }
    
    return maxDist
}
