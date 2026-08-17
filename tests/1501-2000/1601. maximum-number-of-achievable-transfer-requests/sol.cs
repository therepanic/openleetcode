public class Solution {
    private int ans = 0;
    
    public int MaximumRequests(int n, int[][] requests) {
        int[] indegree = new int[n];
        Helper(0, requests, indegree, n, 0);
        return ans;
    }
    
    private void Helper(int start, int[][] requests, int[] indegree, int n, int count) {
        if (start == requests.Length) {
            for (int i = 0; i < n; i++) {
                if (indegree[i] != 0) return;
            }
            ans = Math.Max(ans, count);
            return;
        }
        
        // Take
        indegree[requests[start][0]]--;
        indegree[requests[start][1]]++;
        Helper(start + 1, requests, indegree, n, count + 1);
        
        // Not-take
        indegree[requests[start][0]]++;
        indegree[requests[start][1]]--;
        Helper(start + 1, requests, indegree, n, count);
    }
}
