public class Solution {
    public int Evaluate(string expression) {
        Func<string, bool> isnum = (string t) => t[0] == '-' || char.IsDigit(t[0]);
        
        Func<string, List<Dictionary<string, int>>, int> lookup = (string v, List<Dictionary<string, int>> env) => {
            for (int i = env.Count - 1; i >= 0; i--) {
                if (env[i].ContainsKey(v)) return env[i][v];
            }
            return 0;
        };
        
        Func<string, List<string>> toks = (string s) => {
            List<string> res = new List<string>();
            int i = 0, n = s.Length, bal = 0, st = 0;
            while (i < n) {
                char c = s[i];
                if (c == '(') bal++;
                else if (c == ')') bal--;
                else if (c == ' ' && bal == 0) {
                    if (st < i) res.Add(s.Substring(st, i - st));
                    st = i + 1;
                }
                i++;
            }
            if (st < n) res.Add(s.Substring(st));
            return res;
        };
        
        Func<string, List<Dictionary<string, int>>, int> evals = null;
        evals = (string e, List<Dictionary<string, int>> env) => {
            if (e[0] != '(') {
                if (isnum(e)) return int.Parse(e);
                return lookup(e, env);
            }
            string inner = e.Substring(1, e.Length - 2);
            List<string> parts = toks(inner);
            string op = parts[0];
            if (op == "add") return evals(parts[1], env) + evals(parts[2], env);
            if (op == "mult") return evals(parts[1], env) * evals(parts[2], env);
            
            Dictionary<string, int> loc = new Dictionary<string, int>();
            env.Add(loc);
            int i = 1;
            while (i < parts.Count - 1) {
                string v = parts[i];
                int val = evals(parts[i + 1], env);
                loc[v] = val;
                i += 2;
            }
            int ans = evals(parts[parts.Count - 1], env);
            env.RemoveAt(env.Count - 1);
            return ans;
        };
        
        return evals(expression, new List<Dictionary<string, int>>());
    }
}
