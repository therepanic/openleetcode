class Solution {
  bool parseBoolExpr(String expression) {
    List<List<Object>> st = [[]];
    for (var ch in expression.split('')) {
      if (ch == '&') {
        st.add(['&']);
      } else if (ch == '|') {
        st.add(['|']);
      } else if (ch == '!') {
        st.add(['!']);
      } else if (ch == 't') {
        st.last.add(true);
      } else if (ch == 'f') {
        st.last.add(false);
      } else if (ch == ')') {
        var popped = st.removeLast();
        var op = popped.removeAt(0) as String;
        var top = st.last;
        if (op == '&') {
          top.add(popped.every((v) => v as bool));
        } else if (op == '|') {
          top.add(popped.any((v) => v as bool));
        } else if (op == '!') {
          top.add(!(popped[0] as bool));
        }
      }
    }
    return st[0][0] as bool;
  }
}
