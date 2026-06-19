class Solution {
    public String toHex(int num) {
        if (num == 0) return "0";
        long n = num;
        if (n < 0) n += (1L << 32);
        char[] h = "0123456789abcdef".toCharArray();
        StringBuilder sb = new StringBuilder();
        while (n > 0) {
            sb.append(h[(int)(n & 15)]);
            n /= 16;
        }
        return sb.reverse().toString();
    }
}
