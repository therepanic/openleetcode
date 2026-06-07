public class Solution {
    public int Reverse(int x) {
        long res = 0;
        while (x != 0) {
            res = res * 10 + x % 10;
            x /= 10;
            if (res < int.MinValue || res > int.MaxValue) {
                return 0;
            }
        }
        return (int)res;
    }
}
