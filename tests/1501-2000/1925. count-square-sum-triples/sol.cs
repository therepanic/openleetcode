public class Solution {
    public int CountTriples(int n) {
        int cnt = 0;
        int nsqrt = (int) Math.Sqrt(n);
        for (int s = 2; s <= nsqrt; s++) {
            int start = (s & 1) + 1;
            for (int t = start; t < s; t += 2) {
                if (Gcd(s, t) != 1) continue;
                int c = s * s + t * t;
                if (c > n) break;
                int k = n / c;
                cnt += 2 * k;
            }
        }
        return cnt;
    }
    private int Gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
}
