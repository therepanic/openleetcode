class Solution {
    func flipgame(_ fronts: [Int], _ backs: [Int]) -> Int {
        var bad = Set<Int>()
        for i in 0..<fronts.count {
            if fronts[i] == backs[i] {
                bad.insert(fronts[i])
            }
        }
        var best = 2001
        for i in 0..<fronts.count {
            if !bad.contains(fronts[i]) && fronts[i] < best {
                best = fronts[i]
            }
            if !bad.contains(backs[i]) && backs[i] < best {
                best = backs[i]
            }
        }
        return best <= 2000 ? best : 0
    }
}
