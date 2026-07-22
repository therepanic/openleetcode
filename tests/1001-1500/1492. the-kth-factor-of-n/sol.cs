public class Solution {
    public int KthFactor(int n, int k) {
        var ab = new System.Collections.Generic.List<int>();
        for (int i = 1; i <= n; i++) {
            if (n % i == 0) {
                ab.Add(i);
            }
        }
        if (ab.Count < k) {
            return -1;
        } else {
            return ab[k - 1];
        }
    }
}
