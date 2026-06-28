class Solution {
  int evaluate(String expression) {
    bool isnum(String t) => t[0] == '-' || (t.codeUnitAt(0) >= 48 && t.codeUnitAt(0) <= 57);
    
    int lookup(String v, List<Map<String, int>> env) {
      for (int i = env.length - 1; i >= 0; i--) {
        if (env[i].containsKey(v)) return env[i][v]!;
      }
      return 0;
    }
    
    List<String> toks(String s) {
      List<String> res = [];
      int i = 0, n = s.length, bal = 0, st = 0;
      while (i < n) {
        String c = s[i];
        if (c == '(') bal++;
        else if (c == ')') bal--;
        else if (c == ' ' && bal == 0) {
          if (st < i) res.add(s.substring(st, i));
          st = i + 1;
        }
        i++;
      }
      if (st < n) res.add(s.substring(st));
      return res;
    }
    
    int evals(String e, List<Map<String, int>> env) {
      if (e[0] != '(') {
        if (isnum(e)) return int.parse(e);
        return lookup(e, env);
      }
      String inner = e.substring(1, e.length - 1);
      List<String> parts = toks(inner);
      String op = parts[0];
      if (op == 'add') return evals(parts[1], env) + evals(parts[2], env);
      if (op == 'mult') return evals(parts[1], env) * evals(parts[2], env);
      
      Map<String, int> loc = {};
      env.add(loc);
      int i = 1;
      while (i < parts.length - 1) {
        String v = parts[i];
        int val = evals(parts[i + 1], env);
        loc[v] = val;
        i += 2;
      }
      int ans = evals(parts.last, env);
      env.removeLast();
      return ans;
    }
    
    return evals(expression, []);
  }
}
