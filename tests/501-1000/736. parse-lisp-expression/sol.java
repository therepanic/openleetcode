class Solution {
    public int evaluate(String expression) {
        return evals(expression, new java.util.ArrayList<>());
    }
    
    private boolean isnum(String t) {
        return t.charAt(0) == '-' || Character.isDigit(t.charAt(0));
    }
    
    private int lookup(String v, java.util.List<java.util.Map<String, Integer>> env) {
        for (int i = env.size() - 1; i >= 0; i--) {
            if (env.get(i).containsKey(v)) {
                return env.get(i).get(v);
            }
        }
        return 0;
    }
    
    private java.util.List<String> toks(String s) {
        java.util.List<String> res = new java.util.ArrayList<>();
        int i = 0, n = s.length(), bal = 0, st = 0;
        while (i < n) {
            char c = s.charAt(i);
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
    
    private int evals(String e, java.util.List<java.util.Map<String, Integer>> env) {
        if (e.charAt(0) != '(') {
            if (isnum(e)) return Integer.parseInt(e);
            return lookup(e, env);
        }
        String inner = e.substring(1, e.length() - 1);
        java.util.List<String> parts = toks(inner);
        String op = parts.get(0);
        if (op.equals("add")) return evals(parts.get(1), env) + evals(parts.get(2), env);
        if (op.equals("mult")) return evals(parts.get(1), env) * evals(parts.get(2), env);
        
        java.util.Map<String, Integer> loc = new java.util.HashMap<>();
        env.add(loc);
        int i = 1;
        while (i < parts.size() - 1) {
            String v = parts.get(i);
            int val = evals(parts.get(i + 1), env);
            loc.put(v, val);
            i += 2;
        }
        int ans = evals(parts.get(parts.size() - 1), env);
        env.remove(env.size() - 1);
        return ans;
    }
}
