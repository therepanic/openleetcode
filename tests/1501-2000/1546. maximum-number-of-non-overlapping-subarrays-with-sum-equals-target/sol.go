func maxNonOverlapping(nums []int, target int) int {
    numOfSubarrays := 0
    temp := 0
    visited := map[int]bool{0: true}
    for _, num := range nums {
        temp += num
        prev := temp - target
        if visited[prev] {
            visited = map[int]bool{}
            numOfSubarrays++
        }
        visited[temp] = true
    }
    return numOfSubarrays
}
