public class Solution {
    public int MaxLength(IList<string> arr) {
        int ans = 0;
        int n = arr.Count;

        void dfs(int i, string path) {
            ans = Math.Max(ans, path.Length);
            for (int j = i; j < n; j++) {
                string s = arr[j];
                if (new HashSet<char>(s).Count != s.Length) continue;
                bool hasCommon = false;
                foreach (char c in s) {
                    if (path.IndexOf(c) != -1) {
                        hasCommon = true;
                        break;
                    }
                }
                if (hasCommon) continue;
                dfs(j + 1, path + s);
            }
        }

        dfs(0, "");
        return ans;
    }
}
