public class Solution {
    public string BaseNeg2(int n) {
        if (n == 0) {
            return "0";
        }
        StringBuilder res = new StringBuilder();
        while (n != 0) {
            int digit = n & 1;
            res.Append((char)('0' + digit));
            n = (n - digit) / -2;
        }
        char[] chars = res.ToString().ToCharArray();
        Array.Reverse(chars);
        return new string(chars);
    }
}
