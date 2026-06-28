class Solution {
    func containVirus(_ isInfected: [[Int]]) -> Int {
        var isInfected = isInfected
        let rows = isInfected.count
        let cols = isInfected[0].count
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var totalWalls = 0

        while true {
            var seen = Array(repeating: Array(repeating: false, count: cols), count: rows)
            var regions = [[[Int]]]()
            var frontiers = [Set<String>]()
            var wallsNeeded = [Int]()

            for r in 0..<rows {
                for c in 0..<cols {
                    if isInfected[r][c] != 1 || seen[r][c] {
                        continue
                    }
                    var stack = [(r, c)]
                    seen[r][c] = true
                    var region = [(Int, Int)]()
                    var frontier = Set<String>()
                    var walls = 0
                    while !stack.isEmpty {
                        let (cr, cc) = stack.removeLast()
                        region.append((cr, cc))
                        for (dr, dc) in directions {
                            let nr = cr + dr
                            let nc = cc + dc
                            if nr < 0 || nr >= rows || nc < 0 || nc >= cols {
                                continue
                            }
                            if isInfected[nr][nc] == 1 && !seen[nr][nc] {
                                seen[nr][nc] = true
                                stack.append((nr, nc))
                            } else if isInfected[nr][nc] == 0 {
                                walls += 1
                                frontier.insert("\(nr)#\(nc)")
                            }
                        }
                    }
                    regions.append(region.map { [$0.0, $0.1] })
                    frontiers.append(frontier)
                    wallsNeeded.append(walls)
                }
            }

            if regions.isEmpty {
                break
            }

            var target = 0
            for i in 1..<frontiers.count {
                if frontiers[i].count > frontiers[target].count {
                    target = i
                }
            }

            if frontiers[target].isEmpty {
                break
            }

            totalWalls += wallsNeeded[target]

            for cell in regions[target] {
                isInfected[cell[0]][cell[1]] = -1
            }

            for i in 0..<regions.count {
                if i == target {
                    continue
                }
                for cell in frontiers[i] {
                    let parts = cell.split(separator: "#")
                    if parts.count == 2,
                       let rr = Int(parts[0]),
                       let cc = Int(parts[1]) {
                        isInfected[rr][cc] = 1
                    }
                }
            }
        }

        return totalWalls
    }
}
