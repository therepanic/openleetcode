class Solution {
public:
    vector<string> braceExpansionII(string expression) {
        stack<vector<string>> stk;
        vector<string> res, cur;
        for (char v : expression) {
            if (isalpha(v)) {
                if (cur.empty()) {
                    cur.push_back(string(1, v));
                } else {
                    vector<string> next;
                    for (string& c : cur) {
                        next.push_back(c + v);
                    }
                    cur = next;
                }
            } else if (v == '{') {
                stk.push(res);
                stk.push(cur);
                res.clear();
                cur.clear();
            } else if (v == '}') {
                vector<string> pre = stk.top(); stk.pop();
                vector<string> preRes = stk.top(); stk.pop();
                vector<string> merged = res;
                merged.insert(merged.end(), cur.begin(), cur.end());
                if (pre.empty()) {
                    cur = merged;
                } else {
                    vector<string> next;
                    for (string& p : pre) {
                        for (string& c : merged) {
                            next.push_back(p + c);
                        }
                    }
                    cur = next;
                }
                res = preRes;
            } else if (v == ',') {
                res.insert(res.end(), cur.begin(), cur.end());
                cur.clear();
            }
        }
        res.insert(res.end(), cur.begin(), cur.end());
        sort(res.begin(), res.end());
        res.erase(unique(res.begin(), res.end()), res.end());
        return res;
    }
};
