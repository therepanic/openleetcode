class Solution {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var blocked = Set<String>()
        for o in obstacles {
            blocked.insert("\(o[0]),\(o[1])")
        }

        let directions = [
            (0, 1), (1, 0), (0, -1), (-1, 0)
        ]

        var x = 0, y = 0
        var dir = 0
        var maxDist = 0

        for cmd in commands {
            if cmd == -1 {
                dir = (dir + 1) % 4
            } else if cmd == -2 {
                dir = (dir + 3) % 4
            } else {
                var steps = cmd
                while steps > 0 {
                    let nx = x + directions[dir].0
                    let ny = y + directions[dir].1

                    if blocked.contains("\(nx),\(ny)") {
                        break
                    }

                    x = nx
                    y = ny

                    maxDist = max(maxDist, x * x + y * y)
                    steps -= 1
                }
            }
        }

        return maxDist
    }
}
