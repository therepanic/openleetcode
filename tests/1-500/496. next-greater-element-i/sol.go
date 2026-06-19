func nextGreaterElement(nums1 []int, nums2 []int) []int {
    nextGreater := make(map[int]int)
    stack := []int{}
    
    for i := len(nums2) - 1; i >= 0; i-- {
        num := nums2[i]
        for len(stack) > 0 && stack[len(stack)-1] <= num {
            stack = stack[:len(stack)-1]
        }
        if len(stack) == 0 {
            nextGreater[num] = -1
        } else {
            nextGreater[num] = stack[len(stack)-1]
        }
        stack = append(stack, num)
    }
    
    result := make([]int, len(nums1))
    for i, num := range nums1 {
        result[i] = nextGreater[num]
    }
    return result
}
