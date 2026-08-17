class Solution {
    func maxBuilding(_ n: Int, _ restrictions: [[Int]]) -> Int {
        var r = restrictions
        r.append([1, 0])
        r.sort { $0[0] < $1[0] }
        let m = r.count
        
        for i in 1..<m {
            r[i][1] = min(r[i][1], r[i-1][1] + abs(r[i][0] - r[i-1][0]))
        }
        
        for i in stride(from: m-2, through: 0, by: -1) {
            r[i][1] = min(r[i][1], r[i+1][1] + abs(r[i+1][0] - r[i][0]))
        }
        
        var res = 0
        for i in 1..<m {
            let peak = (r[i-1][1] + r[i][1] + r[i][0] - r[i-1][0]) / 2
            res = max(res, peak)
        }
        
        return max(res, r[m-1][1] + n - r[m-1][0])
    }
}
