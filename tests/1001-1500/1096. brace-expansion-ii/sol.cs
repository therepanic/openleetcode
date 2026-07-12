public class Solution {
    public IList<string> BraceExpansionII(string expression) {
        Stack<List<string>> stack = new Stack<List<string>>();
        List<string> res = new List<string>();
        List<string> cur = new List<string>();
        foreach (char v in expression) {
            if (char.IsLetter(v)) {
                if (cur.Count == 0) {
                    cur = new List<string> { v.ToString() };
                } else {
                    cur = cur.Select(c => c + v).ToList();
                }
            } else if (v == '{') {
                stack.Push(res);
                stack.Push(new List<string>(cur));
                res = new List<string>();
                cur = new List<string>();
            } else if (v == '}') {
                List<string> pre = stack.Pop();
                List<string> preRes = stack.Pop();
                List<string> merged = new List<string>(res);
                merged.AddRange(cur);
                if (pre.Count == 0) {
                    cur = merged;
                } else {
                    cur = pre.SelectMany(p => merged.Select(c => p + c)).ToList();
                }
                res = preRes;
            } else if (v == ',') {
                res.AddRange(cur);
                cur = new List<string>();
            }
        }
        res.AddRange(cur);
        return res.Distinct().OrderBy(s => s).ToList();
    }
}
