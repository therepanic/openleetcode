public class Solution {
    public string Evaluate(string s, IList<IList<string>> knowledge) {
        var mp = new Dictionary<string, string>();
        foreach (var pair in knowledge) {
            mp[pair[0]] = pair[1];
        }
        var ans = new StringBuilder();
        int i = 0, n = s.Length;
        while (i < n) {
            if (s[i] == '(') {
                i++;
                var temp = new StringBuilder();
                while (i < n && s[i] != ')') {
                    temp.Append(s[i]);
                    i++;
                }
                if (mp.ContainsKey(temp.ToString())) ans.Append(mp[temp.ToString()]);
                else ans.Append("?");
                i++;
            } else {
                ans.Append(s[i]);
                i++;
            }
        }
        return ans.ToString();
    }
}
