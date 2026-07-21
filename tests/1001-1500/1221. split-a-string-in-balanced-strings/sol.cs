public class Solution {
    public int BalancedStringSplit(string s) {
        int bal = 0;
        int count = 0;
        foreach (char c in s) {
            if (c == 'L') {
                bal++;
            } else if (c == 'R') {
                bal--;
            }
            if (bal == 0) {
                count++;
            }
        }
        return count;
    }
}
