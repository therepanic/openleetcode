using System.Collections.Generic;

public class Solution {
    public IList<string> FindRepeatedDnaSequences(string s) {
        var seen = new Dictionary<string, int>();
        var ans = new List<string>();
        for (int i = 0; i + 10 <= s.Length; i++) {
            string sub = s.Substring(i, 10);
            int count = seen.ContainsKey(sub) ? seen[sub] : 0;
            if (count == 1) ans.Add(sub);
            seen[sub] = count + 1;
        }
        return ans;
    }
}
