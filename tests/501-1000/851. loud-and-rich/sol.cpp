class Solution {
public:
    vector<int> loudAndRich(vector<vector<int>>& richer, vector<int>& quiet) {
        int n = quiet.size();
        vector<vector<int>> graph(n);
        for (auto& pair : richer) {
            graph[pair[1]].push_back(pair[0]);
        }
        
        vector<int> answer(n, -1);
        
        function<int(int)> dfs = [&](int i) -> int {
            if (answer[i] != -1) return answer[i];
            answer[i] = i;
            for (int nei : graph[i]) {
                int item = dfs(nei);
                if (quiet[item] < quiet[answer[i]]) {
                    answer[i] = item;
                }
            }
            return answer[i];
        };
        
        for (int i = 0; i < n; i++) {
            dfs(i);
        }
        return answer;
    }
};
