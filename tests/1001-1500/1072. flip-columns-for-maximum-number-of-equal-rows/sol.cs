public class Solution {
    public int MaxEqualRowsAfterFlips(int[][] matrix) {
        var count = new System.Collections.Generic.Dictionary<string, int>();
        int ans = 0;

        foreach (var row in matrix) {
            int flip = row[0];
            var sb = new System.Text.StringBuilder();
            foreach (int x in row) {
                sb.Append(x ^ flip);
                sb.Append(',');
            }
            string key = sb.ToString();
            if (!count.ContainsKey(key)) count[key] = 0;
            count[key]++;
            if (count[key] > ans) ans = count[key];
        }

        return ans;
    }
}
