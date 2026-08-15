class Solution {
public:
    int minOperationsToFlip(string expression) {
        unordered_map<int, int> loc;
        vector<int> stack;
        for (int i = expression.size() - 1; i >= 0; --i) {
            if (expression[i] == ')') stack.push_back(i);
            else if (expression[i] == '(') {
                loc[stack.back()] = i;
                stack.pop_back();
            }
        }
        function<pair<int,int>(int,int)> fn = [&](int lo, int hi) -> pair<int,int> {
            if (lo == hi) return {expression[lo] - '0', 1};
            if (expression[hi] == ')' && loc[hi] == lo) return fn(lo+1, hi-1);
            int mid = loc.count(hi) ? loc[hi] - 1 : hi - 1;
            auto [v, c] = fn(mid+1, hi);
            auto [vv, cc] = fn(lo, mid-1);
            char op = expression[mid];
            int val, chg;
            if (op == '|') {
                val = v | vv;
                if (v == 0 && vv == 0) chg = min(c, cc);
                else if (v == 1 && vv == 1) chg = 1 + min(c, cc);
                else chg = 1;
            } else {
                val = v & vv;
                if (v == 0 && vv == 0) chg = 1 + min(c, cc);
                else if (v == 1 && vv == 1) chg = min(c, cc);
                else chg = 1;
            }
            return {val, chg};
        };
        return fn(0, expression.size()-1).second;
    }
};
