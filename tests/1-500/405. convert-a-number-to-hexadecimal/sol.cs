public class Solution {
    public string ToHex(int num) {
        if (num == 0) return "0";
        long n = num;
        if (n < 0) n += 1L << 32;
        char[] h = "0123456789abcdef".ToCharArray();
        List<char> r = new List<char>();
        while (n > 0) {
            r.Add(h[n & 15]);
            n /= 16;
        }
        r.Reverse();
        return new string(r.ToArray());
    }
}
