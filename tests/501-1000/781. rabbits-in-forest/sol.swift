class Solution {
    func numRabbits(_ answers: [Int]) -> Int {
        var mpp: [Int: Int] = [:]
        for a in answers {
            mpp[a, default: 0] += 1
        }
        var total = 0
        for (x, count) in mpp {
            total += Int(ceil(Double(count) / Double(x + 1))) * (x + 1)
        }
        return total
    }
}
