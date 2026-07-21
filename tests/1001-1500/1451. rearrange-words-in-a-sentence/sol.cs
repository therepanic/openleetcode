public class Solution {
    public string ArrangeWords(string text) {
        string[] s = text.Split(" ");
        Array.Sort(s, (a, b) => a.Length.CompareTo(b.Length));
        for (int i = 0; i < s.Length; i++) {
            s[i] = s[i].ToLower();
        }
        if (s.Length > 0) {
            s[0] = char.ToUpper(s[0][0]) + s[0].Substring(1);
        }
        return string.Join(" ", s);
    }
}
