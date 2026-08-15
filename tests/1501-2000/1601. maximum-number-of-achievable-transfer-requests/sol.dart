class Solution {
  int ans = 0;
  
  int maximumRequests(int n, List<List<int>> requests) {
    List<int> indegree = List.filled(n, 0);
    helper(0, requests, indegree, n, 0);
    return ans;
  }
  
  void helper(int start, List<List<int>> requests, List<int> indegree, int n, int count) {
    if (start == requests.length) {
      bool ok = true;
      for (int i = 0; i < n; i++) {
        if (indegree[i] != 0) {
          ok = false;
          break;
        }
      }
      if (ok && count > ans) ans = count;
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
