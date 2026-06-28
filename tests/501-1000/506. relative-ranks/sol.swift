class Solution {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        let n = score.count
        let sorted = score.sorted(by: >)
        var ranks = [Int: String]()
        for i in 0..<n {
            ranks[sorted[i]] = String(i + 1)
        }
        ranks[sorted[0]] = "Gold Medal"
        if n > 1 {
            ranks[sorted[1]] = "Silver Medal"
        }
        if n > 2 {
            ranks[sorted[2]] = "Bronze Medal"
        }
        return score.map { ranks[$0]! }
    }
}
