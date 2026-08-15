class Solution {
    fun maximalNetworkRank(n: Int, roads: Array<IntArray>): Int {
        val a = Array(n) { IntArray(n) }
        for (road in roads) {
            a[road[0]][road[1]] = 1
            a[road[1]][road[0]] = 1
        }
        
        val d = IntArray(n) { i -> a[i].sum() }
        
        val rank = Array(n) { IntArray(n) { -1 } }
        for (i in 0 until n) {
            for (j in 0 until n) {
                if (i != j) {
                    rank[i][j] = d[i] + d[j] - a[i][j]
                }
            }
        }
        
        var answer = -1
        for (row in rank) {
            for (value in row) {
                if (value > answer) answer = value
            }
        }
        return answer
    }
}
