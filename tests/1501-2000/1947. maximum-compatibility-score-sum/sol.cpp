class Solution {
public:
    int maxCompatibilitySum(vector<vector<int>>& students, vector<vector<int>>& mentors) {
        int m = students.size();
        int maxScore = 0;
        vector<int> perm(m);
        iota(perm.begin(), perm.end(), 0);
        do {
            int total = 0;
            for (int i = 0; i < m; i++) {
                for (int j = 0; j < students[i].size(); j++) {
                    if (students[i][j] == mentors[perm[i]][j]) total++;
                }
            }
            maxScore = max(maxScore, total);
        } while (next_permutation(perm.begin(), perm.end()));
        return maxScore;
    }
};
