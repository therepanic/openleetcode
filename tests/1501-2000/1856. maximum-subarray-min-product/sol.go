func maxSumMinProduct(nums []int) int {
    n := len(nums)
    prefix := make([]int64, n+1)
    for i := 0; i < n; i++ {
        prefix[i+1] = prefix[i] + int64(nums[i])
    }
    
    leftBound := make([]int, n)
    rightBound := make([]int, n)
    for i := 0; i < n; i++ {
        leftBound[i] = -1
        rightBound[i] = n
    }
    stack := []int{}
    for i := 0; i < n; i++ {
        for len(stack) > 0 && nums[stack[len(stack)-1]] > nums[i] {
            rightBound[stack[len(stack)-1]] = i
            stack = stack[:len(stack)-1]
        }
        stack = append(stack, i)
    }
    stack = []int{}
    for i := n-1; i >= 0; i-- {
        for len(stack) > 0 && nums[stack[len(stack)-1]] > nums[i] {
            leftBound[stack[len(stack)-1]] = i
            stack = stack[:len(stack)-1]
        }
        stack = append(stack, i)
    }
    
    var maxProd int64 = 0
    for i := 0; i < n; i++ {
        l, r := leftBound[i], rightBound[i]
        total := prefix[r] - prefix[l+1]
        prod := int64(nums[i]) * total
        if prod > maxProd {
            maxProd = prod
        }
    }
    return int(maxProd % 1000000007)
}
