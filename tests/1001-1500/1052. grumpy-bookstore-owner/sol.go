func maxSatisfied(customers []int, grumpy []int, minutes int) int {
    n := len(customers)
    totalSatisfied := 0
    currentWindowGain := 0
    
    for i := 0; i < n; i++ {
        if grumpy[i] == 0 {
            totalSatisfied += customers[i]
        } else if i < minutes {
            currentWindowGain += customers[i]
        }
    }
    
    maxWindowGain := currentWindowGain
    
    for i := minutes; i < n; i++ {
        if grumpy[i] == 1 {
            currentWindowGain += customers[i]
        }
        if grumpy[i - minutes] == 1 {
            currentWindowGain -= customers[i - minutes]
        }
        if currentWindowGain > maxWindowGain {
            maxWindowGain = currentWindowGain
        }
    }
    
    return totalSatisfied + maxWindowGain
}
