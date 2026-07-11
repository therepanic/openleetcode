func maxSubarraySumCircular(nums []int) int {
    maxSum := nums[0]
    minSum := nums[0]
    currMaxSum := nums[0]
    currMinSum := nums[0]
    totalSum := nums[0]
    
    for i := 1; i < len(nums); i++ {
        if currMaxSum + nums[i] > nums[i] {
            currMaxSum = currMaxSum + nums[i]
        } else {
            currMaxSum = nums[i]
        }
        if currMaxSum > maxSum {
            maxSum = currMaxSum
        }
        
        if currMinSum + nums[i] < nums[i] {
            currMinSum = currMinSum + nums[i]
        } else {
            currMinSum = nums[i]
        }
        if currMinSum < minSum {
            minSum = currMinSum
        }
        
        totalSum += nums[i]
    }
    
    circularSum := totalSum - minSum
    
    if circularSum == 0 {
        return maxSum
    }
    
    if maxSum > circularSum {
        return maxSum
    }
    return circularSum
}
