class Solution {
    func largestValsFromLabels(_ values: [Int], _ labels: [Int], _ numWanted: Int, _ useLimit: Int) -> Int {
        let n = values.count
        var pairs = [(Int, Int)]()
        for i in 0..<n {
            pairs.append((values[i], labels[i]))
        }
        pairs.sort { $0.0 > $1.0 }
        var res = 0
        var freq = [Int: Int]()
        var wanted = numWanted
        for (value, label) in pairs {
            if wanted == 0 { break }
            if freq[label] == nil || freq[label]! < useLimit {
                res += value
                freq[label, default: 0] += 1
                wanted -= 1
            }
        }
        return res
    }
}
