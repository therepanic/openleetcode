public class Solution {
    public int MinOperations(string s) {
        int c = 0, j = 0, n = s.Length;
        foreach (char ch in s) {
            if (ch - '0' == j) {
                c++;
            }
            j ^= 1;
        }
        return Math.Min(c, n - c);
    }
}
