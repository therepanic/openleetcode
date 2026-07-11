public class Solution {
    public int[] NumberOfLines(int[] widths, string s) {
        int lines = 1;
        int current = 0;
        foreach (char c in s) {
            int w = widths[c - 'a'];
            if (current + w > 100) {
                lines++;
                current = w;
            } else {
                current += w;
            }
        }
        return new int[] { lines, current };
    }
}
