class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        var l = 0
        let n = cardPoints.count
        var total = cardPoints[(n - k)...].reduce(0, +)
        var res = total
        for r in (n - k)..<n {
            total += cardPoints[l] - cardPoints[r]
            res = max(res, total)
            l += 1
        }
        return res
    }
}
