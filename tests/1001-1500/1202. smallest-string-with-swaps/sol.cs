public class Solution {
    public string SmallestStringWithSwaps(string s, IList<IList<int>> pairs) {
        int n = s.Length;
        int[] parent = new int[n];
        for (int i = 0; i < n; i++) parent[i] = i;
        
        int Find(int x) {
            if (parent[x] != x) {
                parent[x] = Find(parent[x]);
            }
            return parent[x];
        }
        
        void Union(int x, int y) {
            int rx = Find(x), ry = Find(y);
            if (rx != ry) parent[rx] = ry;
        }
        
        foreach (var pair in pairs) {
            Union(pair[0], pair[1]);
        }
        
        Dictionary<int, List<int>> groups = new Dictionary<int, List<int>>();
        for (int i = 0; i < n; i++) {
            int root = Find(i);
            if (!groups.ContainsKey(root)) {
                groups[root] = new List<int>();
            }
            groups[root].Add(i);
        }
        
        char[] res = new char[n];
        foreach (var indices in groups.Values) {
            List<char> chars = new List<char>();
            foreach (int idx in indices) {
                chars.Add(s[idx]);
            }
            indices.Sort();
            chars.Sort();
            for (int k = 0; k < indices.Count; k++) {
                res[indices[k]] = chars[k];
            }
        }
        
        return new string(res);
    }
}
