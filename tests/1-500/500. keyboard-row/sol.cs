public class Solution {
    public string[] FindWords(string[] words) {
        var m = new Dictionary<char, int>();
        foreach (char c in "qwertyuiop") m[c] = 1;
        foreach (char c in "asdfghjkl") m[c] = 2;
        foreach (char c in "zxcvbnm") m[c] = 3;
        var ans = new List<string>();
        foreach (string w in words) {
            string lw = w.ToLower();
            int r = m[lw[0]];
            if (lw.All(ch => m[ch] == r)) {
                ans.Add(w);
            }
        }
        return ans.ToArray();
    }
}
