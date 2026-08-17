class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        let n = boxes.count
        var distances = [Int](repeating: 0, count: n)
        let chars = Array(boxes)
        
        var prefixCount = 0
        var prefixSum = 0
        
        for i in 0..<n {
            distances[i] = prefixCount * i - prefixSum
            if chars[i] == "1" {
                prefixCount += 1
                prefixSum += i
            }
        }
        
        var suffixCount = 0
        var suffixSum = 0
        
        for i in stride(from: n - 1, through: 0, by: -1) {
            distances[i] += suffixSum - suffixCount * i
            if chars[i] == "1" {
                suffixCount += 1
                suffixSum += i
            }
        }
        
        return distances
    }
}
