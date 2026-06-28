func maxChunksToSorted(arr []int) int {
    ans := 0
    prevMax := 0
    for idx, x := range arr {
        if x > prevMax {
            prevMax = x
        }
        if prevMax == idx {
            ans++
        }
    }
    return ans
}
