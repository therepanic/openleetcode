public class Solution {
    public IList<IList<string>> AccountsMerge(string[][] accounts) {
        var parent = new Dictionary<string, string>();
        var owner = new Dictionary<string, string>();

        string Find(string x) {
            if (parent[x] != x) {
                parent[x] = Find(parent[x]);
            }
            return parent[x];
        }

        void Union(string a, string b) {
            var ra = Find(a);
            var rb = Find(b);
            if (ra != rb) {
                parent[rb] = ra;
            }
        }

        foreach (var account in accounts) {
            var name = account[0];
            var first = account[1];
            if (!parent.ContainsKey(first)) parent[first] = first;
            owner[first] = name;
            for (int i = 1; i < account.Length; i++) {
                var email = account[i];
                if (!parent.ContainsKey(email)) parent[email] = email;
                owner[email] = name;
                Union(first, email);
            }
        }

        var groups = new Dictionary<string, List<string>>();
        foreach (var email in owner.Keys) {
            var root = Find(email);
            if (!groups.ContainsKey(root)) {
                groups[root] = new List<string>();
            }
            groups[root].Add(email);
        }

        IList<IList<string>> result = new List<IList<string>>();
        foreach (var kv in groups) {
            kv.Value.Sort(System.StringComparer.Ordinal);
            var merged = new List<string> { owner[kv.Key] };
            merged.AddRange(kv.Value);
            result.Add(merged);
        }
        return result;
    }
}
