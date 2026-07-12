class Solution {
    public boolean parseBoolExpr(String expression) {
        java.util.Stack<Character> st = new java.util.Stack<>();
        for (char ch : expression.toCharArray()) {
            if (ch == ',') continue;
            if (ch != ')') {
                st.push(ch);
                continue;
            }
            boolean hasTrue = false;
            boolean hasFalse = false;
            while (!st.isEmpty() && st.peek() != '(') {
                char v = st.pop();
                if (v == 't') hasTrue = true;
                if (v == 'f') hasFalse = true;
            }
            st.pop();
            char op = st.pop();
            if (op == '!') {
                st.push(hasTrue ? 'f' : 't');
            } else if (op == '&') {
                st.push(hasFalse ? 'f' : 't');
            } else {
                st.push(hasTrue ? 't' : 'f');
            }
        }
        return st.peek() == 't';
    }
}
