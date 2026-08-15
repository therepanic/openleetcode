class Solution {
    func stoneGameVIII(_ stones: [Int]) -> Int {
        let n = stones.count
        var prefix = stones
        for i in 1..<n {
            prefix[i] += prefix[i-1]
        }
        var memo = [Int](repeating: Int.min, count: n)
        
        func rec(_ i: Int) -> Int {
            if i == n - 2 {
                return prefix[i+1]
            }
            if memo[i] != Int.min {
                return memo[i]
            }
            let aliceCont = rec(i+1)
            let aliceDone = prefix[i+1] - rec(i+1)
            memo[i] = max(aliceCont, aliceDone)
            return memo[i]
        }
        
        return rec(0)
    }
}
