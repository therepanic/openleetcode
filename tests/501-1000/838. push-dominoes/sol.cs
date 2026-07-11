public class Solution {
    public string PushDominoes(string dominoes) {
        string s = "L" + dominoes + "R";
        System.Text.StringBuilder res = new System.Text.StringBuilder();
        int prev = 0;
        for (int curr = 1; curr < s.Length; curr++) {
            if (s[curr] == '.') continue;
            int span = curr - prev - 1;
            if (prev > 0) res.Append(s[prev]);
            if (s[prev] == s[curr]) {
                res.Append(new string(s[prev], span));
            } else if (s[prev] == 'L' && s[curr] == 'R') {
                res.Append(new string('.', span));
            } else {
                res.Append(new string('R', span / 2));
                if (span % 2 == 1) res.Append('.');
                res.Append(new string('L', span / 2));
            }
            prev = curr;
        }
        return res.ToString();
    }
}
