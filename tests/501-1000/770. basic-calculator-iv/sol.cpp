class Solution {
public:
    vector<string> basicCalculatorIV(string expression, vector<string>& evalvars, vector<int>& evalints) {
        unordered_map<string, int> evalmap;
        for (int i = 0; i < evalvars.size(); i++)
            evalmap[evalvars[i]] = evalints[i];

        vector<string> tokens;
        string buf;
        for (char ch : expression) {
            if (isalnum(ch)) {
                buf += ch;
            } else {
                if (!buf.empty()) { tokens.push_back(buf); buf.clear(); }
                if (ch == '+' || ch == '-' || ch == '*' || ch == '(' || ch == ')')
                    tokens.push_back(string(1, ch));
            }
        }
        if (!buf.empty()) tokens.push_back(buf);

        stack<unordered_map<string, int>> vals;
        stack<string> ops;
        unordered_map<string, int> prec = {{"+", 1}, {"-", 1}, {"*", 2}};

        auto applyOp = [&]() {
            string op = ops.top(); ops.pop();
            auto b = vals.top(); vals.pop();
            auto a = vals.top(); vals.pop();
            if (op == "+") vals.push(add(a, b));
            else if (op == "-") vals.push(sub(a, b));
            else vals.push(mul(a, b));
        };

        for (const string& tok : tokens) {
            if (tok == "(") ops.push(tok);
            else if (tok == ")") {
                while (!ops.empty() && ops.top() != "(") applyOp();
                ops.pop();
            } else if (prec.count(tok)) {
                while (!ops.empty() && ops.top() != "(" && prec[ops.top()] >= prec[tok])
                    applyOp();
                ops.push(tok);
            } else vals.push(parseToken(tok, evalmap));
        }
        while (!ops.empty()) applyOp();
        auto poly = vals.top();

        vector<pair<vector<string>, int>> items;
        for (const auto& [k, v] : poly) {
            if (v == 0) continue;
            vector<string> vars;
            if (!k.empty()) {
                stringstream ss(k);
                string var;
                while (getline(ss, var, ',')) vars.push_back(var);
            }
            items.push_back({vars, v});
        }
        sort(items.begin(), items.end(), [](const auto& a, const auto& b) {
            if (a.first.size() != b.first.size())
                return a.first.size() > b.first.size();
            string sa, sb;
            for (const auto& s : a.first) sa += s + "*";
            for (const auto& s : b.first) sb += s + "*";
            return sa < sb;
        });

        vector<string> ans;
        for (const auto& [vars, coeff] : items) {
            if (vars.empty()) ans.push_back(to_string(coeff));
            else {
                string term = to_string(coeff);
                for (const auto& v : vars) term += "*" + v;
                ans.push_back(term);
            }
        }
        return ans;
    }

private:
    static string makeKey(vector<string>& vars) {
        sort(vars.begin(), vars.end());
        string key;
        for (int i = 0; i < vars.size(); i++) {
            if (i > 0) key += ",";
            key += vars[i];
        }
        return key;
    }

    static unordered_map<string, int> combine(const unordered_map<string, int>& poly) {
        unordered_map<string, int> res;
        for (const auto& [k, v] : poly)
            if (v != 0) res[k] += v;
        return res;
    }

    static unordered_map<string, int> add(const unordered_map<string, int>& a, const unordered_map<string, int>& b) {
        unordered_map<string, int> res = a;
        for (const auto& [k, v] : b) res[k] += v;
        return combine(res);
    }

    static unordered_map<string, int> sub(const unordered_map<string, int>& a, const unordered_map<string, int>& b) {
        unordered_map<string, int> res = a;
        for (const auto& [k, v] : b) res[k] -= v;
        return combine(res);
    }

    static unordered_map<string, int> mul(const unordered_map<string, int>& a, const unordered_map<string, int>& b) {
        unordered_map<string, int> res;
        for (const auto& [k1, v1] : a) {
            vector<string> va;
            if (!k1.empty()) {
                stringstream ss(k1);
                string var;
                while (getline(ss, var, ',')) va.push_back(var);
            }
            for (const auto& [k2, v2] : b) {
                vector<string> vb;
                if (!k2.empty()) {
                    stringstream ss(k2);
                    string var;
                    while (getline(ss, var, ',')) vb.push_back(var);
                }
                vector<string> merged = va;
                merged.insert(merged.end(), vb.begin(), vb.end());
                string key = makeKey(merged);
                res[key] += v1 * v2;
            }
        }
        return combine(res);
    }

    static unordered_map<string, int> parseToken(const string& tok, const unordered_map<string, int>& evalmap) {
        unordered_map<string, int> res;
        bool isNum = true;
        for (char ch : tok) if (!isdigit(ch)) { isNum = false; break; }
        if (isNum) res[""] = stoi(tok);
        else if (evalmap.count(tok)) res[""] = evalmap.at(tok);
        else res[tok] = 1;
        return res;
    }
};
