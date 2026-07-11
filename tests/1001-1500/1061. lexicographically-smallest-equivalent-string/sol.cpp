class Solution {
public:
    string smallestEquivalentString(string s1, string s2, string baseStr) {
        unordered_map<char, vector<char>> adj;
        for (int i = 0; i < s1.size(); i++) {
            adj[s1[i]].push_back(s2[i]);
            adj[s2[i]].push_back(s1[i]);
        }

        function<char(char, unordered_set<char>&)> dfs = [&](char ch, unordered_set<char>& visited) -> char {
            visited.insert(ch);
            char minCh = ch;
            for (char nei : adj[ch]) {
                if (!visited.count(nei)) {
                    char candidate = dfs(nei, visited);
                    minCh = min(minCh, candidate);
                }
            }
            return minCh;
        };

        string result;
        for (char ch : baseStr) {
            unordered_set<char> visited;
            result += dfs(ch, visited);
        }
        return result;
    }
};
