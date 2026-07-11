public class Solution {
    public string FindReplaceString(string s, int[] indices, string[] sources, string[] targets) {
        Dictionary<int, (string, string)> patch = new Dictionary<int, (string, string)>();
        for (int k = 0; k < indices.Length; k++) {
            int i = indices[k];
            string src = sources[k];
            string tgt = targets[k];
            if (i + src.Length <= s.Length && s.Substring(i, src.Length) == src) {
                patch[i] = (src, tgt);
            }
        }
        System.Text.StringBuilder res = new System.Text.StringBuilder();
        int idx = 0;
        int n = s.Length;
        while (idx < n) {
            if (patch.ContainsKey(idx)) {
                var (src, tgt) = patch[idx];
                res.Append(tgt);
                idx += src.Length;
            } else {
                res.Append(s[idx]);
                idx++;
            }
        }
        return res.ToString();
    }
}
