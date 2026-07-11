class Solution {
    public String baseNeg2(int n) {
        if (n == 0) {
            return "0";
        }
        StringBuilder res = new StringBuilder();
        while (n != 0) {
            int digit = n & 1;
            res.append((char)('0' + digit));
            n = (n - digit) / -2;
        }
        return res.reverse().toString();
    }
}
