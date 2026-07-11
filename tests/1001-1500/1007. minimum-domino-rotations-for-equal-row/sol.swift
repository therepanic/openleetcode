class Solution {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        let n = tops.count
        var res = Int.max
        var face = [Int](repeating: 0, count: 7)
        for i in 0..<n {
            face[tops[i]] += 1
            if bottoms[i] != tops[i] {
                face[bottoms[i]] += 1
            }
        }
        for x in 1...6 {
            if face[x] < n {
                continue
            }
            var maintainTop = 0
            var maintainBottom = 0
            var possible = true
            for i in 0..<n {
                if tops[i] != x {
                    maintainTop += 1
                }
                if bottoms[i] != x {
                    maintainBottom += 1
                }
            }
            if possible {
                res = min(res, min(maintainTop, maintainBottom))
            }
        }
        return res == Int.max ? -1 : res
    }
}
