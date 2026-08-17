class Solution {
    private var ans = 0
    
    fun maximumRequests(n: Int, requests: Array<IntArray>): Int {
        val indegree = IntArray(n)
        helper(0, requests, indegree, n, 0)
        return ans
    }
    
    private fun helper(start: Int, requests: Array<IntArray>, indegree: IntArray, n: Int, count: Int) {
        if (start == requests.size) {
            for (i in 0 until n) {
                if (indegree[i] != 0) return
            }
            ans = maxOf(ans, count)
            return
        }
        
        // Take
        indegree[requests[start][0]]--
        indegree[requests[start][1]]++
        helper(start + 1, requests, indegree, n, count + 1)
        
        // Not-take
        indegree[requests[start][0]]++
        indegree[requests[start][1]]--
        helper(start + 1, requests, indegree, n, count)
    }
}
