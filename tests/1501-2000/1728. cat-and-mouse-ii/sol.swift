class Solution {
    private var m: Int!
    private var n: Int!
    private var catJump: Int!
    private var mouseJump: Int!
    private let dirs = [(-1,0),(0,1),(1,0),(0,-1)]
    private var walls = Set<Int>()
    private var food: Int!
    private var memo = [Int: Bool]()

    func canMouseWin(_ grid: [String], _ catJump: Int, _ mouseJump: Int) -> Bool {
        m = grid.count
        n = grid[0].count
        self.catJump = catJump
        self.mouseJump = mouseJump

        var cat = 0
        var mouse = 0
        for i in 0..<m {
            let chars = Array(grid[i])
            for j in 0..<n {
                let idx = i * n + j
                switch chars[j] {
                case "F":
                    food = idx
                case "C":
                    cat = idx
                case "M":
                    mouse = idx
                case "#":
                    walls.insert(idx)
                default:
                    break
                }
            }
        }

        return dfs(cat, mouse, 0)
    }

    private func key(_ cat: Int, _ mouse: Int, _ turn: Int) -> Int {
        return (cat * m * n + mouse) * (m * n * 2) + turn
    }

    private func dfs(_ cat: Int, _ mouse: Int, _ turn: Int) -> Bool {
        let k = key(cat, mouse, turn)
        if let val = memo[k] { return val }

        let cx = cat / n, cy = cat % n
        let mx = mouse / n, my = mouse % n

        if (cat == food || cat == mouse || turn >= m * n * 2) {
            memo[k] = false
            return false
        }
        if mouse == food {
            memo[k] = true
            return true
        }

        var result: Bool
        if turn % 2 == 0 { // mouse
            result = false
            outer: for d in dirs {
                for jump in 0...mouseJump {
                    let nx = mx + jump * d.0, ny = my + jump * d.1
                    if nx < 0 || nx >= m || ny < 0 || ny >= n || walls.contains(nx * n + ny) { break }
                    if dfs(cat, nx * n + ny, turn + 1) {
                        result = true
                        break outer
                    }
                }
            }
        } else { // cat
            result = true
            outer: for d in dirs {
                for jump in 0...catJump {
                    let nx = cx + jump * d.0, ny = cy + jump * d.1
                    if nx < 0 || nx >= m || ny < 0 || ny >= n || walls.contains(nx * n + ny) { break }
                    if !dfs(nx * n + ny, mouse, turn + 1) {
                        result = false
                        break outer
                    }
                }
            }
        }

        memo[k] = result
        return result
    }
}
