public class Solution {
    public int CountLargestGroup(int n) {
        Dictionary<int, int> mpp = new Dictionary<int, int>();
        int maxi = 0, count = 0;

        for (int i = 1; i <= n; i++) {
            int x = DigSum(i);
            if (mpp.ContainsKey(x)) {
                mpp[x]++;
            } else {
                mpp[x] = 1;
            }
            maxi = Math.Max(maxi, mpp[x]);
        }

        foreach (int v in mpp.Values) {
            if (v == maxi) {
                count++;
            }
        }
        return count;
    }

    private int DigSum(int n) {
        int s = 0;
        while (n > 0) {
            s += n % 10;
            n /= 10;
        }
        return s;
    }
}
