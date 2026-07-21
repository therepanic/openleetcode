public class Solution {
    public IList<string> StringMatching(string[] words) {
        int n = words.Length;
        IList<string> ans = new List<string>();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j && words[j].Contains(words[i])) {
                    ans.Add(words[i]);
                    break;
                }
            }
        }
        return ans;
    }
}
