public class Solution {
    public int FindLUSlength(string a, string b) {
        if (a == b) {
            return -1;
        } else {
            return Math.Max(a.Length, b.Length);
        }
    }
}
