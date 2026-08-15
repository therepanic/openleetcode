class Solution {
    fun boxDelivering(boxes: Array<IntArray>, portsCount: Int, maxBoxes: Int, maxWeight: Int): Int {
        val n = boxes.size
        val ports = IntArray(n+1)
        val weights = IntArray(n+1)
        for (i in 0 until n) {
            ports[i+1] = boxes[i][0]
            weights[i+1] = boxes[i][1]
        }
        val prefixWeights = IntArray(n+1)
        for (i in 1..n) {
            prefixWeights[i] = prefixWeights[i-1] + weights[i]
        }
        val portsCnt = IntArray(n+2)
        for (i in 2..n) {
            portsCnt[i] = portsCnt[i-1] + if (ports[i] != ports[i-1]) 1 else 0
        }
        portsCnt[n+1] = portsCnt[n]
        val dp = IntArray(n+1)
        val queue = ArrayDeque<Int>()
        queue.add(0)
        var left = 0
        for (i in 1..n) {
            while (i - left > maxBoxes || prefixWeights[i] - prefixWeights[left] > maxWeight) {
                if (!queue.isEmpty() && queue.first == left) {
                    queue.removeFirst()
                }
                left++
            }
            dp[i] = 2 + portsCnt[i] + (dp[queue.first] - portsCnt[queue.first+1])
            val idx = dp[i] - portsCnt[i+1]
            while (!queue.isEmpty() && (dp[queue.last] - portsCnt[queue.last+1]) >= idx) {
                queue.removeLast()
            }
            queue.addLast(i)
        }
        return dp[n]
    }
}
