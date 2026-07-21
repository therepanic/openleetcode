class Solution {
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        var counts = [Int](repeating: 0, count: 1001)
        
        for i in 0..<target.count {
            counts[target[i]] += 1
            counts[arr[i]] -= 1
        }
        
        return counts.allSatisfy { $0 == 0 }
    }
}
