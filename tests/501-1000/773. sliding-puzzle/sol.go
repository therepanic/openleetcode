func slidingPuzzle(board [][]int) int {
    target := "123450"
    var startBytes []byte
    for i := 0; i < 2; i++ {
        for j := 0; j < 3; j++ {
            startBytes = append(startBytes, byte(board[i][j]+'0'))
        }
    }
    start := string(startBytes)
    
    neighbors := map[int][]int{
        0: {1, 3}, 1: {0, 2, 4}, 2: {1, 5},
        3: {0, 4}, 4: {1, 3, 5}, 5: {2, 4},
    }
    
    type stateMoves struct {
        state string
        moves int
    }
    
    queue := []stateMoves{{start, 0}}
    visited := map[string]bool{start: true}
    
    for len(queue) > 0 {
        current := queue[0]
        queue = queue[1:]
        
        if current.state == target {
            return current.moves
        }
        
        zeroIndex := 0
        for i, ch := range current.state {
            if ch == '0' {
                zeroIndex = i
                break
            }
        }
        
        for _, neighbor := range neighbors[zeroIndex] {
            runes := []rune(current.state)
            runes[zeroIndex], runes[neighbor] = runes[neighbor], runes[zeroIndex]
            newState := string(runes)
            
            if !visited[newState] {
                visited[newState] = true
                queue = append(queue, stateMoves{newState, current.moves + 1})
            }
        }
    }
    
    return -1
}
