public class Solution {
    public IList<string> RemoveSubfolders(string[] folder) {
        Array.Sort(folder);
        var res = new List<string>();
        foreach (string f in folder) {
            if (res.Count == 0) {
                res.Add(f);
            } else {
                string prev = res[res.Count - 1];
                if (f.StartsWith(prev) && f.Length > prev.Length && f[prev.Length] == '/') {
                    continue;
                } else {
                    res.Add(f);
                }
            }
        }
        return res;
    }
}
