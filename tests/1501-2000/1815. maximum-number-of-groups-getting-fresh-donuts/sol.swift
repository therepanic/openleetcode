class Solution {
    func maxHappyGroups(_ batchSize: Int, _ groups: [Int]) -> Int {
        var counts = [Int](repeating: 0, count: batchSize)
        var happyCount = 0
        for g in groups {
            let rem = g % batchSize
            if rem == 0 {
                happyCount += 1
            } else {
                counts[rem] += 1
            }
        }
        
        for i in 1...(batchSize / 2) {
            if i == batchSize - i {
                let pairCount = counts[i] / 2
                happyCount += pairCount
                counts[i] %= 2
            } else {
                let pairCount = min(counts[i], counts[batchSize - i])
                happyCount += pairCount
                counts[i] -= pairCount
                counts[batchSize - i] -= pairCount
            }
        }
        
        let state = Array(counts[1...])
        var memo = [String: Int]()
        return happyCount + viterbi(state, 0, batchSize, &memo)
    }
    
    private func viterbi(_ counts: [Int], _ leftover: Int, _ batchSize: Int, _ memo: inout [String: Int]) -> Int {
        let key = counts.map { String($0) }.joined(separator: ",") + "," + String(leftover)
        if let val = memo[key] {
            return val
        }
        
        if counts.reduce(0, +) == 0 {
            memo[key] = 0
            return 0
        }
        
        var res = 0
        for i in 0..<counts.count {
            if counts[i] > 0 {
                let rem = i + 1
                var next = counts
                next[i] -= 1
                
                let isHappy = (leftover == 0) ? 1 : 0
                let newLeftover = (leftover + rem) % batchSize
                
                let val = isHappy + viterbi(next, newLeftover, batchSize, &memo)
                if val > res {
                    res = val
                }
            }
        }
        memo[key] = res
        return res
    }
}
