public class Solution {
    public bool ParseBoolExpr(string expression) {
        var st = new System.Collections.Generic.Stack<System.Collections.Generic.List<object>>();
        st.Push(new System.Collections.Generic.List<object>());
        foreach (char ch in expression) {
            if (ch == '&') {
                st.Push(new System.Collections.Generic.List<object> { "&" });
            } else if (ch == '|') {
                st.Push(new System.Collections.Generic.List<object> { "|" });
            } else if (ch == '!') {
                st.Push(new System.Collections.Generic.List<object> { "!" });
            } else if (ch == 't') {
                st.Peek().Add(true);
            } else if (ch == 'f') {
                st.Peek().Add(false);
            } else if (ch == ')') {
                var popped = st.Pop();
                string op = (string)popped[0];
                popped.RemoveAt(0);
                var top = st.Peek();
                if (op == "&") {
                    bool res = true;
                    foreach (bool v in popped) res = res && v;
                    top.Add(res);
                } else if (op == "|") {
                    bool res = false;
                    foreach (bool v in popped) res = res || v;
                    top.Add(res);
                } else if (op == "!") {
                    top.Add(!(bool)popped[0]);
                }
            }
        }
        return (bool)st.Peek()[0];
    }
}
