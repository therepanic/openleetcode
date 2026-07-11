class Solution {
public:
    int numSimilarGroups(vector<string>& strs) {
        int n = strs.size();
        
        auto checkSimilarity = [](const string& str1, const string& str2) -> bool {
            int diff = 0;
            for (int i = 0; i < str1.length(); i++) {
                if (str1[i] != str2[i]) {
                    diff++;
                }
            }
            return diff == 0 || diff == 2;
        };
        
        vector<vector<int>> matrix(n);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (checkSimilarity(strs[i], strs[j])) {
                    matrix[i].push_back(j);
                    matrix[j].push_back(i);
                }
            }
        }
        
        int count = 0;
        vector<bool> visited(n, false);
        
        function<void(int)> dfs = [&](int node) {
            if (visited[node]) {
                return;
            }
            visited[node] = true;
            for (int nei : matrix[node]) {
                if (!visited[nei]) {
                    dfs(nei);
                }
            }
        };
        
        for (int start = 0; start < n; start++) {
            if (!visited[start]) {
                dfs(start);
                count++;
            }
        }
        
        return count;
    }
};
