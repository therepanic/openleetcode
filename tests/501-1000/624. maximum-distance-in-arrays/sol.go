func maxDistance(arrays [][]int) int {
    smallest := arrays[0][0]
    largest := arrays[0][len(arrays[0])-1]
    ans := 0
    for i := 1; i < len(arrays); i++ {
        curMin := arrays[i][0]
        curMax := arrays[i][len(arrays[i])-1]
        ans = max(ans, max(largest - curMin, curMax - smallest))
        smallest = min(curMin, smallest)
        largest = max(curMax, largest)
    }
    return ans
}
