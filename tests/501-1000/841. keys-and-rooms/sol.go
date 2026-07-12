func canVisitAllRooms(rooms [][]int) bool {
    n := len(rooms)
    keys := []int{0}
    visited := make([]bool, n)
    visited[0] = true
    count := 1
    for len(keys) > 0 {
        room := keys[len(keys)-1]
        keys = keys[:len(keys)-1]
        for _, i := range rooms[room] {
            if !visited[i] {
                visited[i] = true
                keys = append(keys, i)
                count++
            }
        }
    }
    return count == n
}
