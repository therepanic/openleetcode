class Solution {
    func canReorderDoubled(_ arr: [Int]) -> Bool {
        var freq = [Int: Int]()
        for i in arr {
            freq[i, default: 0] += 1
        }
        
        let sortedArr = arr.sorted { abs($0) < abs($1) }
        for val in sortedArr {
            if freq[val] == 0 { continue }
            let target = val * 2
            if let count = freq[target], count > 0 {
                freq[val]! -= 1
                freq[target]! -= 1
            } else {
                return false
            }
        }
        return true
    }
}
