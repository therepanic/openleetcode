func oddEvenJumps(arr []int) int {
    n := len(arr)
    nextHigher := make([]int, n)
    nextLower := make([]int, n)
    for i := range nextHigher {
        nextHigher[i] = -1
        nextLower[i] = -1
    }
    
    indices := make([]int, n)
    for i := range indices {
        indices[i] = i
    }
    
    sort.Slice(indices, func(a, b int) bool {
        return arr[indices[a]] < arr[indices[b]]
    })
    stack := []int{}
    for _, i := range indices {
        for len(stack) > 0 && i > stack[len(stack)-1] {
            nextHigher[stack[len(stack)-1]] = i
            stack = stack[:len(stack)-1]
        }
        stack = append(stack, i)
    }
    
    sort.Slice(indices, func(a, b int) bool {
        return arr[indices[a]] > arr[indices[b]]
    })
    stack = []int{}
    for _, i := range indices {
        for len(stack) > 0 && i > stack[len(stack)-1] {
            nextLower[stack[len(stack)-1]] = i
            stack = stack[:len(stack)-1]
        }
        stack = append(stack, i)
    }
    
    odd := make([]bool, n)
    even := make([]bool, n)
    odd[n-1] = true
    even[n-1] = true
    
    result := 1
    for i := n - 2; i >= 0; i-- {
        if nextHigher[i] != -1 {
            odd[i] = even[nextHigher[i]]
        }
        if nextLower[i] != -1 {
            even[i] = odd[nextLower[i]]
        }
        if odd[i] {
            result++
        }
    }
    return result
}
