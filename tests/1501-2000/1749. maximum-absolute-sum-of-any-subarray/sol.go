func maxAbsoluteSum(nums []int) int {
    prefixSum := 0
    minPrefixSum := 0
    maxPrefixSum := 0
    maxAbsoluteSum := 0

    for _, num := range nums {
        prefixSum += num
        
        if diff := prefixSum - minPrefixSum; diff > maxAbsoluteSum {
            maxAbsoluteSum = diff
        }
        if diff := prefixSum - maxPrefixSum; -diff > maxAbsoluteSum {
            maxAbsoluteSum = -diff
        }
        
        if prefixSum < minPrefixSum {
            minPrefixSum = prefixSum
        }
        if prefixSum > maxPrefixSum {
            maxPrefixSum = prefixSum
        }
    }

    return maxAbsoluteSum
}
