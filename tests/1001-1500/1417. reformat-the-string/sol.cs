public class Solution {
    public string Reformat(string s) {
        var digits = new List<char>();
        var letters = new List<char>();
        foreach (char c in s) {
            if (char.IsDigit(c)) {
                digits.Add(c);
            } else if (char.IsLetter(c)) {
                letters.Add(c);
            }
        }
        if (Math.Abs(digits.Count - letters.Count) >= 2) {
            return "";
        }
        char[] ans = new char[s.Length];
        if (digits.Count > letters.Count) {
            for (int i = 0; i < s.Length; i++) {
                if (i % 2 == 0) {
                    ans[i] = digits[i / 2];
                } else {
                    ans[i] = letters[i / 2];
                }
            }
        } else {
            for (int i = 0; i < s.Length; i++) {
                if (i % 2 == 0) {
                    ans[i] = letters[i / 2];
                } else {
                    ans[i] = digits[i / 2];
                }
            }
        }
        return new string(ans);
    }
}
