public class Solution {
    public int XorOperation(int n, int start) {
        int ans = 0;
        while (n > 0) {
            ans ^= start;
            start += 2;
            n--;
        }
        return ans;
    }
}
