class Solution {
    func gridIllumination(_ n: Int, _ lamps: [[Int]], _ queries: [[Int]]) -> [Int] {
        var rowCount: [Int: Int] = [:]
        var colCount: [Int: Int] = [:]
        var diag1: [Int: Int] = [:]
        var diag2: [Int: Int] = [:]
        var lampSet = Set<[Int]>()
        var ans = [Int](repeating: 0, count: queries.count)
        let dirs = [[-1,-1], [-1,0], [-1,1], [0,-1], [0,0], [0,1], [1,-1], [1,0], [1,1]]
        
        for lamp in lamps {
            let r = lamp[0], c = lamp[1]
            let key = [r, c]
            if !lampSet.contains(key) {
                lampSet.insert(key)
                rowCount[r, default: 0] += 1
                colCount[c, default: 0] += 1
                diag1[r - c, default: 0] += 1
                diag2[r + c, default: 0] += 1
            }
        }
        
        for i in 0..<queries.count {
            let r = queries[i][0], c = queries[i][1]
            if (rowCount[r] ?? 0) > 0 || (colCount[c] ?? 0) > 0 || 
               (diag1[r - c] ?? 0) > 0 || (diag2[r + c] ?? 0) > 0 {
                ans[i] = 1
                for d in dirs {
                    let nr = r + d[0], nc = c + d[1]
                    let key = [nr, nc]
                    if lampSet.contains(key) {
                        lampSet.remove(key)
                        rowCount[nr]! -= 1
                        colCount[nc]! -= 1
                        diag1[nr - nc]! -= 1
                        diag2[nr + nc]! -= 1
                    }
                }
            } else {
                ans[i] = 0
            }
        }
        return ans
    }
}
