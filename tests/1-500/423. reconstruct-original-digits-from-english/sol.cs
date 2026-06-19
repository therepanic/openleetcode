using System.Text;

public class Solution {
    public string OriginalDigits(string s) {
        int[] c = new int[128];
        foreach (char ch in s) {
            c[ch]++;
        }
        int[] d = new int[10];
        d[0] = c['z'];
        d[2] = c['w'];
        d[4] = c['u'];
        d[6] = c['x'];
        d[8] = c['g'];
        d[1] = c['o'] - d[0] - d[2] - d[4];
        d[3] = c['h'] - d[8];
        d[5] = c['f'] - d[4];
        d[7] = c['s'] - d[6];
        d[9] = c['i'] - d[5] - d[6] - d[8];
        var result = new StringBuilder();
        for (int i = 0; i <= 9; i++) {
            result.Append(new string((char)('0' + i), d[i]));
        }
        return result.ToString();
    }
}
