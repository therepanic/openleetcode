class Solution {
    func findMinMoves(_ machines: [Int]) -> Int {
        let n = machines.count
        let total = machines.reduce(0, +)
        if total % n != 0 {
            return -1
        }
        let avg = total / n
        let imbalances = machines.map { $0 - avg }
        var res = 0
        var d = 0
        for imb in imbalances {
            res = max(res, abs(d))
            res = max(res, imb)
            d += imb
        }
        return res
    }
}
