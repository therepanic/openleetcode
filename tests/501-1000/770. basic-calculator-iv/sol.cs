public class Solution {
    public IList<string> BasicCalculatorIV(string expression, string[] evalvars, int[] evalints) {
        var evalmap = new Dictionary<string, int>();
        for (int i = 0; i < evalvars.Length; i++)
            evalmap[evalvars[i]] = evalints[i];

        var tokens = new List<string>();
        var buf = "";
        foreach (char ch in expression) {
            if (char.IsLetterOrDigit(ch)) {
                buf += ch;
            } else {
                if (buf.Length > 0) { tokens.Add(buf); buf = ""; }
                if ("+-*()".Contains(ch)) tokens.Add(ch.ToString());
            }
        }
        if (buf.Length > 0) tokens.Add(buf);

        var vals = new Stack<Dictionary<string, int>>();
        var ops = new Stack<string>();
        var prec = new Dictionary<string, int> { {"+", 1}, {"-", 1}, {"*", 2} };

        Action applyOp = () => {
            string op = ops.Pop();
            var b = vals.Pop(); var a = vals.Pop();
            if (op == "+") vals.Push(Add(a, b));
            else if (op == "-") vals.Push(Sub(a, b));
            else vals.Push(Mul(a, b));
        };

        foreach (string tok in tokens) {
            if (tok == "(") ops.Push(tok);
            else if (tok == ")") {
                while (ops.Peek() != "(") applyOp();
                ops.Pop();
            }
            else if (prec.ContainsKey(tok)) {
                while (ops.Count > 0 && ops.Peek() != "(" && prec[ops.Peek()] >= prec[tok]) applyOp();
                ops.Push(tok);
            }
            else vals.Push(ParseToken(tok, evalmap));
        }
        while (ops.Count > 0) applyOp();
        var poly = vals.Pop();

        var result = new List<string>();
        var items = poly.Where(kv => kv.Value != 0)
                        .Select(kv => (key: kv.Key.Split(',').Where(s => s.Length > 0).ToArray(), coeff: kv.Value))
                        .OrderByDescending(x => x.key.Length)
                        .ThenBy(x => string.Join("*", x.key))
                        .ToList();

        foreach (var item in items) {
            if (item.key.Length == 0)
                result.Add(item.coeff.ToString());
            else
                result.Add(item.coeff + "*" + string.Join("*", item.key));
        }
        return result;
    }

    private string MakeKey(string[] vars) {
        Array.Sort(vars);
        return string.Join(",", vars);
    }

    private Dictionary<string, int> Combine(Dictionary<string, int> poly) {
        var res = new Dictionary<string, int>();
        foreach (var kv in poly)
            if (kv.Value != 0) res[kv.Key] = kv.Value;
        return res;
    }

    private Dictionary<string, int> Add(Dictionary<string, int> a, Dictionary<string, int> b) {
        var res = new Dictionary<string, int>(a);
        foreach (var kv in b)
            res[kv.Key] = res.GetValueOrDefault(kv.Key) + kv.Value;
        return Combine(res);
    }

    private Dictionary<string, int> Sub(Dictionary<string, int> a, Dictionary<string, int> b) {
        var res = new Dictionary<string, int>(a);
        foreach (var kv in b)
            res[kv.Key] = res.GetValueOrDefault(kv.Key) - kv.Value;
        return Combine(res);
    }

    private Dictionary<string, int> Mul(Dictionary<string, int> a, Dictionary<string, int> b) {
        var res = new Dictionary<string, int>();
        foreach (var ka in a) {
            foreach (var kb in b) {
                var merged = new List<string>();
                if (ka.Key.Length > 0) merged.AddRange(ka.Key.Split(','));
                if (kb.Key.Length > 0) merged.AddRange(kb.Key.Split(','));
                var key = MakeKey(merged.ToArray());
                res[key] = res.GetValueOrDefault(key) + ka.Value * kb.Value;
            }
        }
        return Combine(res);
    }

    private Dictionary<string, int> ParseToken(string tok, Dictionary<string, int> evalmap) {
        var res = new Dictionary<string, int>();
        if (int.TryParse(tok, out int num)) {
            res[""] = num;
        } else if (evalmap.ContainsKey(tok)) {
            res[""] = evalmap[tok];
        } else {
            res[tok] = 1;
        }
        return res;
    }
}
