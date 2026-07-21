class Solution {
public:
    string rankTeams(vector<string>& votes) {
        string teams = votes[0];
        int n = teams.size();
        unordered_map<char, vector<int>> positions;
        for (char team : teams) {
            positions[team] = vector<int>(n, 0);
        }
        for (const string& vote : votes) {
            for (int i = 0; i < n; i++) {
                positions[vote[i]][i]++;
            }
        }
        sort(teams.begin(), teams.end(), [&](char a, char b) {
            const vector<int>& countsA = positions[a];
            const vector<int>& countsB = positions[b];
            for (int i = 0; i < n; i++) {
                if (countsA[i] != countsB[i]) {
                    return countsA[i] > countsB[i];
                }
            }
            return a < b;
        });
        return teams;
    }
};
