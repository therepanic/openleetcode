class Solution {
public:
    int maximumRequests(int n, vector<vector<int>>& requests) {
        ans = 0;
        vector<int> indegree(n, 0);
        helper(0, requests, indegree, n, 0);
        return ans;
    }
    
private:
    int ans;
    
    void helper(int start, vector<vector<int>>& requests, vector<int>& indegree, int n, int count) {
        if (start == requests.size()) {
            for (int i = 0; i < n; i++) {
                if (indegree[i] != 0) return;
            }
            ans = max(ans, count);
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
};
