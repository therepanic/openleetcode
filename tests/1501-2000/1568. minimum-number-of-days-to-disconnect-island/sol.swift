class Solution {
    func minDays(_ grid: [[Int]]) -> Int {
        var grid = grid
        let dirs = [(-1,0),(1,0),(0,-1),(0,1)]
        
        func countIslands() -> Int {
            var seen = Set<[Int]>()
            var islands = 0
            
            for i in 0..<grid.count {
                for j in 0..<grid[0].count {
                    if grid[i][j] == 1 && !seen.contains([i,j]) {
                        islands += 1
                        var stack = [[i,j]]
                        seen.insert([i,j])
                        while !stack.isEmpty {
                            let cell = stack.removeLast()
                            for d in dirs {
                                let nx = cell[0] + d.0
                                let ny = cell[1] + d.1
                                if nx >= 0 && nx < grid.count && ny >= 0 && ny < grid[0].count && grid[nx][ny] == 1 && !seen.contains([nx,ny]) {
                                    seen.insert([nx,ny])
                                    stack.append([nx,ny])
                                }
                            }
                        }
                    }
                }
            }
            return islands
        }
        
        if countIslands() != 1 {
            return 0
        }
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    grid[i][j] = 0
                    if countIslands() != 1 {
                        return 1
                    }
                    grid[i][j] = 1
                }
            }
        }
        return 2
    }
}
