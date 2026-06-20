class Solution {
public:
    int minMutation(string startGene, string endGene, vector<string>& bank) {
        unordered_set<string> s(bank.begin(), bank.end());
        if (!s.count(endGene) && startGene != endGene) return -1;
        queue<pair<string, int>> q;
        unordered_set<string> v;
        q.push({startGene, 0});
        v.insert(startGene);
        vector<char> choices = {'A', 'C', 'G', 'T'};
        while (!q.empty()) {
            auto [g, d] = q.front(); q.pop();
            if (g == endGene) return d;
            for (int i = 0; i < 8; i++) {
                for (char c : choices) {
                    if (g[i] != c) {
                        string n = g;
                        n[i] = c;
                        if (s.count(n) && !v.count(n)) {
                            v.insert(n);
                            q.push({n, d+1});
                        }
                    }
                }
            }
        }
        return -1;
    }
};
