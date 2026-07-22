func findBestValue(arr []int, target int) int {
    getMutatedSum := func(value int) int {
        sum := 0
        for _, x := range arr {
            if x < value {
                sum += x
            } else {
                sum += value
            }
        }
        return sum
    }
    
    low, high := 0, 0
    for _, x := range arr {
        if x > high {
            high = x
        }
    }
    
    result := high
    minDiff := int(^uint(0) >> 1) // MaxInt
    
    for low <= high {
        mid := low + (high - low) / 2
        currSum := getMutatedSum(mid)
        diff := currSum - target
        if diff < 0 {
            diff = -diff
        }
        
        if diff < minDiff || (diff == minDiff && mid < result) {
            minDiff = diff
            result = mid
        }
        
        if currSum < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return result
}
