class Solution {
    func cutOffTree(_ forest: [[Int]]) -> Int {
        let rows = forest.count
        let cols = forest[0].count
        
        if forest[0][0] == 0 {
            return -1
        }
        
        var trees: [(height: Int, row: Int, col: Int)] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if forest[r][c] > 1 {
                    trees.append((forest[r][c], r, c))
                }
            }
        }
        
        trees.sort { $0.height < $1.height }
        
        func findShortestPath(startRow: Int, startCol: Int, targetRow: Int, targetCol: Int) -> Int {
            let directions = [(-1, 0), (0, -1), (0, 1), (1, 0)]
            var queue: [(Int, Int, Int)] = [(startRow, startCol, 0)]
            var visited = Set<String>()
            visited.insert("\(startRow),\(startCol)")
            
            while !queue.isEmpty {
                let (currRow, currCol, steps) = queue.removeFirst()
                
                if currRow == targetRow && currCol == targetCol {
                    return steps
                }
                
                for (dr, dc) in directions {
                    let newRow = currRow + dr
                    let newCol = currCol + dc
                    
                    if newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols &&
                        forest[newRow][newCol] > 0 && !visited.contains("\(newRow),\(newCol)") {
                        queue.append((newRow, newCol, steps + 1))
                        visited.insert("\(newRow),\(newCol)")
                    }
                }
            }
            
            return -1
        }
        
        var totalSteps = 0
        var currentRow = 0, currentCol = 0
        
        for tree in trees {
            let steps = findShortestPath(startRow: currentRow, startCol: currentCol, 
                                         targetRow: tree.row, targetCol: tree.col)
            if steps == -1 {
                return -1
            }
            totalSteps += steps
            currentRow = tree.row
            currentCol = tree.col
        }
        
        return totalSteps
    }
}
