public class Solution {
    public string MakeFancyString(string s) {
        if (string.IsNullOrEmpty(s)) return "";
        var result = new System.Text.StringBuilder();
        result.Append(s[0]);
        char last = s[0];
        int count = 1;

        for (int i = 1; i < s.Length; i++) {
            if (s[i] != last) {
                last = s[i];
                count = 0;
            }

            count++;
            if (count > 2) continue;

            result.Append(s[i]);
        }

        return result.ToString();
    }
}
