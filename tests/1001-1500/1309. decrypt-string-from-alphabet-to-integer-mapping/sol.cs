public class Solution {
    public string FreqAlphabets(string s) {
        var decoded = new System.Text.StringBuilder();
        int index = 0;
        while (index < s.Length) {
            if (index + 2 < s.Length && s[index + 2] == '#') {
                int num = int.Parse(s.Substring(index, 2));
                decoded.Append((char)('a' + num - 1));
                index += 3;
            } else {
                int num = s[index] - '0';
                decoded.Append((char)('a' + num - 1));
                index += 1;
            }
        }
        return decoded.ToString();
    }
}
