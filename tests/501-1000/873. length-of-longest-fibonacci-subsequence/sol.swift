class Solution {
    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        let n = arr.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        var maxLen = 0
        
        for curr in 2..<n {
            var start = 0
            var end = curr - 1
            
            while start < end {
                let pairSum = arr[start] + arr[end]
                
                if pairSum > arr[curr] {
                    end -= 1
                } else if pairSum < arr[curr] {
                    start += 1
                } else {
                    dp[end][curr] = dp[start][end] + 1
                    maxLen = max(dp[end][curr], maxLen)
                    end -= 1
                    start += 1
                }
            }
        }
        
        return maxLen > 0 ? maxLen + 2 : 0
    }
}
