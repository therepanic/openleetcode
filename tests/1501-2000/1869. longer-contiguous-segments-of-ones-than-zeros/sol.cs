public class Solution {
    public bool CheckZeroOnes(string s) {
        int max1 = 0, max0 = 0;
        int one = 0, zero = 0;
        
        foreach (char ch in s) {
            if (ch == '1') {
                one++;
                zero = 0;
                max1 = Math.Max(max1, one);
            } else {
                zero++;
                one = 0;
                max0 = Math.Max(max0, zero);
            }
        }
        
        return max1 > max0;
    }
}
