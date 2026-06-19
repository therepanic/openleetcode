class Solution {
public:
    vector<double> calcEquation(vector<vector<string>>& equations, vector<float>& values, vector<vector<string>>& queries) {
        unordered_map<string, unordered_map<string, double>> g;
        for (int i = 0; i < equations.size(); i++) {
            string a = equations[i][0];
            string b = equations[i][1];
            double v = values[i];
            g[a][b] = v;
            g[b][a] = 1.0 / v;
        }
        
        function<double(string, string)> dfs = [&](string x, string y) {
            if (g.find(x) == g.end() || g.find(y) == g.end()) return -1.0;
            if (x == y) return 1.0;
            stack<pair<string, double>> s;
            unordered_set<string> visited;
            s.push({x, 1.0});
            while (!s.empty()) {
                auto [c, r] = s.top(); s.pop();
                if (c == y) return r;
                visited.insert(c);
                for (auto& [n, w] : g[c]) {
                    if (visited.find(n) == visited.end()) {
                        s.push({n, r * w});
                    }
                }
            }
            return -1.0;
        };
        
        vector<double> res;
        for (auto& q : queries) {
            res.push_back(dfs(q[0], q[1]));
        }
        return res;
    }
};
