public class Solution {
    public double[] CalcEquation(string[][] equations, float[] values, string[][] queries) {
        var g = new Dictionary<string, Dictionary<string, double>>();
        for (int i = 0; i < equations.Length; i++) {
            string a = equations[i][0];
            string b = equations[i][1];
            double v = values[i];
            if (!g.ContainsKey(a)) g[a] = new Dictionary<string, double>();
            g[a][b] = v;
            if (!g.ContainsKey(b)) g[b] = new Dictionary<string, double>();
            g[b][a] = 1.0 / v;
        }
        
        double Dfs(string x, string y) {
            if (!g.ContainsKey(x) || !g.ContainsKey(y)) return -1.0;
            if (x == y) return 1.0;
            var stack = new Stack<Tuple<string, double>>();
            var visited = new HashSet<string>();
            stack.Push(Tuple.Create(x, 1.0));
            while (stack.Count > 0) {
                var (c, r) = stack.Pop();
                if (c == y) return r;
                visited.Add(c);
                foreach (var kvp in g[c]) {
                    string n = kvp.Key;
                    double w = kvp.Value;
                    if (!visited.Contains(n)) {
                        stack.Push(Tuple.Create(n, r * w));
                    }
                }
            }
            return -1.0;
        }
        
        var result = new double[queries.Length];
        for (int i = 0; i < queries.Length; i++) {
            result[i] = Dfs(queries[i][0], queries[i][1]);
        }
        return result;
    }
}
