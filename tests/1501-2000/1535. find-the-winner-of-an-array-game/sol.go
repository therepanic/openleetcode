func getWinner(arr []int, k int) int {
    candidate := arr[0]
    streak := 0
    for i := 1; i < len(arr); i++ {
        if candidate > arr[i] {
            streak++
        } else {
            candidate = arr[i]
            streak = 1
        }
        if streak == k {
            return candidate
        }
    }
    return candidate
}
