class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        var freq: [Int: Int] = [:]
        for num in arr {
            freq[num, default: 0] += 1
        }
        
        let counts = freq.values.sorted(by: >)
        
        var sumRemoved = 0
        var minSetSize = 0
        for count in counts {
            sumRemoved += count
            minSetSize += 1
            if sumRemoved >= arr.count / 2 {
                return minSetSize
            }
        }
        return minSetSize
    }
}
