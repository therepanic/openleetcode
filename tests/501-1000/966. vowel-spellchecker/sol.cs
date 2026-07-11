public class Solution {
    public string[] Spellchecker(string[] wordlist, string[] queries) {
        var exact = new HashSet<string>(wordlist);
        var caseMap = new Dictionary<string, string>();
        var vowelMap = new Dictionary<string, string>();
        
        foreach (var w in wordlist) {
            var lower = w.ToLower();
            var devowel = DeVowel(lower);
            if (!caseMap.ContainsKey(lower)) {
                caseMap[lower] = w;
            }
            if (!vowelMap.ContainsKey(devowel)) {
                vowelMap[devowel] = w;
            }
        }
        
        var result = new string[queries.Length];
        for (int i = 0; i < queries.Length; i++) {
            var q = queries[i];
            if (exact.Contains(q)) {
                result[i] = q;
            } else {
                var lower = q.ToLower();
                var devowel = DeVowel(lower);
                if (caseMap.ContainsKey(lower)) {
                    result[i] = caseMap[lower];
                } else if (vowelMap.ContainsKey(devowel)) {
                    result[i] = vowelMap[devowel];
                } else {
                    result[i] = "";
                }
            }
        }
        return result;
    }
    
    private string DeVowel(string s) {
        var sb = new System.Text.StringBuilder();
        foreach (var c in s) {
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
                sb.Append('*');
            } else {
                sb.Append(c);
            }
        }
        return sb.ToString();
    }
}
