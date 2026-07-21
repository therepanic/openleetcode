public class Solution {
    public string MinRemoveToMakeValid(string s) {
        List<char> t = new List<char>();
        int p = 0;
        foreach (char c in s) {
            if (c == '(') p++;
            else if (c == ')') p--;
            if (p >= 0) {
                t.Add(c);
            } else {
                p = 0;
            }
        }
        p = 0;
        List<char> result = new List<char>();
        for (int i = t.Count - 1; i >= 0; i--) {
            char c = t[i];
            if (c == '(') p++;
            else if (c == ')') p--;
            if (p <= 0) {
                result.Add(c);
            } else {
                p = 0;
            }
        }
        result.Reverse();
        return new string(result.ToArray());
    }
}
