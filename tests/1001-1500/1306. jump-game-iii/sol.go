func canReach(arr []int, start int) bool {
    seen := make(map[int]bool)
    queue := []int{start}
    head := 0
    for head < len(queue) {
        index := queue[head]
        head++
        if index < 0 || index >= len(arr) || seen[index] {
            continue
        }
        if arr[index] == 0 {
            return true
        }
        seen[index] = true
        queue = append(queue, index+arr[index])
        queue = append(queue, index-arr[index])
    }
    return false
}
