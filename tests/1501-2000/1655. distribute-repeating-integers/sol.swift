class Solution {
    func canDistribute(_ nums: [Int], _ quantity: [Int]) -> Bool {
        var quantity = quantity.sorted(by: >)
        var freqCounts: [Int: Int] = [:]
        var freqMap: [Int: Int] = [:]
        for n in nums {
            freqMap[n, default: 0] += 1
        }
        for f in freqMap.values {
            freqCounts[f, default: 0] += 1
        }
        
        func backtrack(_ i: Int) -> Bool {
            if i == quantity.count { return true }
            for (freq, count) in Array(freqCounts) {
                if freq >= quantity[i] && count > 0 {
                    freqCounts[freq] = count - 1
                    let newFreq = freq - quantity[i]
                    freqCounts[newFreq, default: 0] += 1
                    if backtrack(i + 1) { return true }
                    freqCounts[freq] = count
                    let newCount = freqCounts[newFreq]!
                    if newCount == 1 {
                        freqCounts.removeValue(forKey: newFreq)
                    } else {
                        freqCounts[newFreq] = newCount - 1
                    }
                }
            }
            return false
        }
        
        return backtrack(0)
    }
}
