class Solution {
public:
    int calculate(string s) {
        stack<int> st;
        int n = 0;
        char op = '+';
        s += '+';
        
        for (char c : s) {
            if (c == ' ') continue;
            
            if (isdigit(c)) {
                n = n * 10 + (c - '0');
                continue;
            }
            
            if (op == '+') {
                st.push(n);
            } else if (op == '-') {
                st.push(-n);
            } else if (op == '*') {
                int top = st.top();
                st.pop();
                st.push(top * n);
            } else if (op == '/') {
                int top = st.top();
                st.pop();
                st.push(top / n);
            }
            
            op = c;
            n = 0;
        }
        
        int result = 0;
        while (!st.empty()) {
            result += st.top();
            st.pop();
        }
        return result;
    }
};
