class Solution {
    func addRungs(_ rungs: [Int], _ dist: Int) -> Int {
        var curr = 0
        var res = 0
        for rung in rungs {
            if rung - curr > dist {
                res += (rung - curr - 1) / dist
            }
            curr = rung
        }
        return res
    }
}
