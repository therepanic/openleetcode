class Solution {
    func numMovesStonesII(_ stones: [Int]) -> [Int] {
        var stones = stones.sorted()
        let n = stones.count
        
        let maxMoves = max(stones[n - 1] - stones[1] - (n - 2), 
                           stones[n - 2] - stones[0] - (n - 2))
        
        var minMoves = n
        var left = 0
        for right in 0..<n {
            while stones[right] - stones[left] + 1 > n {
                left += 1
            }
            let currentWindowSize = right - left + 1
            if currentWindowSize == n - 1 && stones[right] - stones[left] + 1 == n - 1 {
                minMoves = min(minMoves, 2)
            } else {
                minMoves = min(minMoves, n - currentWindowSize)
            }
        }
        
        return [minMoves, maxMoves]
    }
}
