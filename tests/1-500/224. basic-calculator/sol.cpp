class Solution {
public:
    int calculate(string s) {
        stack<int> st;
        int res = 0;
        int curr = 0;
        int sign = 1;

        for (char c : s) {
            if (isdigit(c)) {
                curr = curr * 10 + (c - '0');
            } else if (c == '+') {
                res += sign * curr;
                sign = 1;
                curr = 0;
            } else if (c == '-') {
                res += sign * curr;
                sign = -1;
                curr = 0;
            } else if (c == '(') {
                st.push(res);
                st.push(sign);
                res = 0;
                sign = 1;
            } else if (c == ')') {
                res += sign * curr;
                curr = 0;
                res *= st.top(); st.pop();
                res += st.top(); st.pop();
            }
        }

        res += sign * curr;
        return res;
    }
};
