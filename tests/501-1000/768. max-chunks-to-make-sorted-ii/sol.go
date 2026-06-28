func maxChunksToSorted(arr []int) int {
    n := len(arr)
    minRight := make([]int, n)
    currentMin := int(^uint(0) >> 1) // max int
    for i := n - 1; i >= 0; i-- {
        if arr[i] < currentMin {
            currentMin = arr[i]
        }
        minRight[i] = currentMin
    }
    
    chunks := 0
    currentMax := -currentMin - 1 // min int
    for i := 0; i < n-1; i++ {
        if arr[i] > currentMax {
            currentMax = arr[i]
        }
        if currentMax <= minRight[i+1] {
            chunks++
        }
    }
    return chunks + 1
}
