class Solution {
public:
    bool parseBoolExpr(string expression) {
        vector<vector<bool>> st(1);
        vector<char> ops;

        for (char ch : expression) {
            if (ch == '&' || ch == '|' || ch == '!') {
                ops.push_back(ch);
                st.emplace_back();
            } else if (ch == 't') {
                st.back().push_back(true);
            } else if (ch == 'f') {
                st.back().push_back(false);
            } else if (ch == ')') {
                vector<bool> cur = std::move(st.back());
                st.pop_back();
                char op = ops.back();
                ops.pop_back();
                bool val;
                if (op == '&') {
                    val = true;
                    for (bool x : cur) val = val && x;
                } else if (op == '|') {
                    val = false;
                    for (bool x : cur) val = val || x;
                } else {
                    val = !cur[0];
                }
                st.back().push_back(val);
            }
        }

        return st[0][0];
    }
};
