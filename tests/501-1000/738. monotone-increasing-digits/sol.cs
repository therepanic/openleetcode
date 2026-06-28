public class Solution {
    public int MonotoneIncreasingDigits(int n) {
        char[] s = n.ToString().ToCharArray();
        int mark = s.Length;
        for (int i = s.Length - 1; i > 0; i--) {
            if (s[i] < s[i - 1]) {
                s[i - 1]--;
                mark = i;
            }
        }
        for (int i = mark; i < s.Length; i++) {
            s[i] = '9';
        }
        return int.Parse(new string(s));
    }
}
