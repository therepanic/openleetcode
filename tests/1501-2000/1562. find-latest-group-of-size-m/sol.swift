class Solution {
    func findLatestStep(_ arr: [Int], _ m: Int) -> Int {
        let n = arr.count
        if m == n { return m }
        
        var groups = [Int](repeating: 0, count: n + 2)
        var latestStep = -1
        
        for i in 0..<n {
            let idx = arr[i]
            let left = groups[idx - 1]
            let right = groups[idx + 1]
            
            if left == m || right == m {
                latestStep = i
            }
            
            let size = left + right + 1
            groups[idx - left] = size
            groups[idx + right] = size
        }
        
        return latestStep
    }
}
