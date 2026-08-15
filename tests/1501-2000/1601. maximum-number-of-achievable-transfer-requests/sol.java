class Solution {
    private int ans = 0;
    
    public int maximumRequests(int n, int[][] requests) {
        int[] indegree = new int[n];
        helper(0, requests, indegree, n, 0);
        return ans;
    }
    
    private void helper(int start, int[][] requests, int[] indegree, int n, int count) {
        if (start == requests.length) {
            for (int i = 0; i < n; i++) {
                if (indegree[i] != 0) return;
            }
            ans = Math.max(ans, count);
            return;
        }
        
        // Take
        indegree[requests[start][0]]--;
        indegree[requests[start][1]]++;
        helper(start + 1, requests, indegree, n, count + 1);
        
        // Not-take
        indegree[requests[start][0]]++;
        indegree[requests[start][1]]--;
        helper(start + 1, requests, indegree, n, count);
    }
}
