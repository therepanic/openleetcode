public class Solution {
    public int MinimumDeletions(string s) {
        int res = 0;
        int count = 0;
        foreach (char ch in s) {
            if (ch == 'b') {
                count++;
            } else if (count > 0) {
                res++;
                count--;
            }
        }
        return res;
    }
}
