func cutOffTree(forest [][]int) int {
    rows := len(forest)
    cols := len(forest[0])
    
    if forest[0][0] == 0 {
        return -1
    }
    
    type Tree struct {
        height, row, col int
    }
    
    trees := []Tree{}
    for r := 0; r < rows; r++ {
        for c := 0; c < cols; c++ {
            if forest[r][c] > 1 {
                trees = append(trees, Tree{forest[r][c], r, c})
            }
        }
    }
    
    sort.Slice(trees, func(i, j int) bool {
        return trees[i].height < trees[j].height
    })
    
    findShortestPath := func(startRow, startCol, targetRow, targetCol int) int {
        directions := [][2]int{{-1, 0}, {0, -1}, {0, 1}, {1, 0}}
        queue := [][3]int{{startRow, startCol, 0}}
        visited := make([][]bool, rows)
        for i := range visited {
            visited[i] = make([]bool, cols)
        }
        visited[startRow][startCol] = true
        
        for len(queue) > 0 {
            curr := queue[0]
            queue = queue[1:]
            currRow, currCol, steps := curr[0], curr[1], curr[2]
            
            if currRow == targetRow && currCol == targetCol {
                return steps
            }
            
            for _, dir := range directions {
                newRow, newCol := currRow+dir[0], currCol+dir[1]
                
                if newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols &&
                    forest[newRow][newCol] > 0 && !visited[newRow][newCol] {
                    queue = append(queue, [3]int{newRow, newCol, steps + 1})
                    visited[newRow][newCol] = true
                }
            }
        }
        
        return -1
    }
    
    totalSteps := 0
    currentRow, currentCol := 0, 0
    
    for _, tree := range trees {
        steps := findShortestPath(currentRow, currentCol, tree.row, tree.col)
        if steps == -1 {
            return -1
        }
        totalSteps += steps
        currentRow, currentCol = tree.row, tree.col
    }
    
    return totalSteps
}
