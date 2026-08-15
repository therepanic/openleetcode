class Solution {
    func boxDelivering(_ boxes: [[Int]], _ portsCount: Int, _ maxBoxes: Int, _ maxWeight: Int) -> Int {
        let n = boxes.count
        var ports = [Int](repeating: 0, count: n+1)
        var weights = [Int](repeating: 0, count: n+1)
        for i in 0..<n {
            ports[i+1] = boxes[i][0]
            weights[i+1] = boxes[i][1]
        }
        var prefixWeights = [Int](repeating: 0, count: n+1)
        for i in 1...n {
            prefixWeights[i] = prefixWeights[i-1] + weights[i]
        }
        var portsCnt = [Int](repeating: 0, count: n+2)
        if n >= 2 {
            for i in 2...n {
                portsCnt[i] = portsCnt[i-1] + (ports[i] != ports[i-1] ? 1 : 0)
            }
        }
        portsCnt[n+1] = portsCnt[n]
        var dp = [Int](repeating: 0, count: n+1)
        var queue = [0]
        var left = 0
        for i in 1...n {
            while i - left > maxBoxes || prefixWeights[i] - prefixWeights[left] > maxWeight {
                if !queue.isEmpty && queue[0] == left {
                    queue.removeFirst()
                }
                left += 1
            }
            dp[i] = 2 + portsCnt[i] + (dp[queue[0]] - portsCnt[queue[0]+1])
            let idx = dp[i] - portsCnt[i+1]
            while !queue.isEmpty && (dp[queue[queue.count-1]] - portsCnt[queue[queue.count-1]+1]) >= idx {
                queue.removeLast()
            }
            queue.append(i)
        }
        return dp[n]
    }
}
