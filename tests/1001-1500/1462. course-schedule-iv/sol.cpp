class Solution {
public:
    vector<bool> checkIfPrerequisite(int n, vector<vector<int>>& prerequisites, vector<vector<int>>& queries) {
        vector<vector<bool>> reach(n, vector<bool>(n));
        for (const auto& edge : prerequisites) reach[edge[0]][edge[1]] = true;
        for (int k = 0; k < n; ++k)
            for (int i = 0; i < n; ++i)
                if (reach[i][k])
                    for (int j = 0; j < n; ++j) reach[i][j] = reach[i][j] || reach[k][j];
        vector<bool> answer;
        for (const auto& query : queries) answer.push_back(reach[query[0]][query[1]]);
        return answer;
    }
};
