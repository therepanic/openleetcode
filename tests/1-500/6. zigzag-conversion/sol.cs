using System.Text;

public class Solution {
    public string Convert(string s, int numRows) {
        if (numRows == 1 || numRows >= s.Length) {
            return s;
        }

        var rows = new StringBuilder[numRows];
        for (int i = 0; i < numRows; i++) {
            rows[i] = new StringBuilder();
        }

        int idx = 0;
        int step = 1;
        foreach (char c in s) {
            rows[idx].Append(c);
            if (idx == 0) {
                step = 1;
            } else if (idx == numRows - 1) {
                step = -1;
            }
            idx += step;
        }

        var result = new StringBuilder();
        foreach (var row in rows) {
            result.Append(row);
        }
        return result.ToString();
    }
}
