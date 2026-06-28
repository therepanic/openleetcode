class Solution {
public:
    int evaluate(string expression) {
        function<bool(const string&)> isnum = [](const string& t) {
            return t[0] == '-' || isdigit(t[0]);
        };
        
        function<int(const string&, vector<unordered_map<string, int>>&)> lookup = 
            [&](const string& v, vector<unordered_map<string, int>>& env) -> int {
            for (int i = env.size() - 1; i >= 0; i--) {
                if (env[i].count(v)) return env[i][v];
            }
            return 0;
        };
        
        function<vector<string>(const string&)> toks = [](const string& s) {
            vector<string> res;
            int i = 0, n = s.size(), bal = 0, st = 0;
            while (i < n) {
                char c = s[i];
                if (c == '(') bal++;
                else if (c == ')') bal--;
                else if (c == ' ' && bal == 0) {
                    if (st < i) res.push_back(s.substr(st, i - st));
                    st = i + 1;
                }
                i++;
            }
            if (st < n) res.push_back(s.substr(st));
            return res;
        };
        
        function<int(const string&, vector<unordered_map<string, int>>&)> evals = 
            [&](const string& e, vector<unordered_map<string, int>>& env) -> int {
            if (e[0] != '(') {
                if (isnum(e)) return stoi(e);
                return lookup(e, env);
            }
            string inner = e.substr(1, e.size() - 2);
            vector<string> parts = toks(inner);
            string op = parts[0];
            if (op == "add") return evals(parts[1], env) + evals(parts[2], env);
            if (op == "mult") return evals(parts[1], env) * evals(parts[2], env);
            
            unordered_map<string, int> loc;
            env.push_back(loc);
            int i = 1;
            while (i < parts.size() - 1) {
                string v = parts[i];
                int val = evals(parts[i + 1], env);
                env.back()[v] = val;
                i += 2;
            }
            int ans = evals(parts.back(), env);
            env.pop_back();
            return ans;
        };
        
        vector<unordered_map<string, int>> env;
        return evals(expression, env);
    }
};
