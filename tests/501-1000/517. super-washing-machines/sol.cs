public class Solution {
    public int FindMinMoves(int[] machines) {
        int n = machines.Length;
        int total = 0;
        foreach (int m in machines) {
            total += m;
        }
        if (total % n != 0) {
            return -1;
        }
        int avg = total / n;
        int[] imbalances = new int[n];
        for (int i = 0; i < n; i++) {
            imbalances[i] = machines[i] - avg;
        }
        int res = 0;
        int d = 0;
        foreach (int imb in imbalances) {
            res = Math.Max(res, Math.Abs(d));
            res = Math.Max(res, imb);
            d += imb;
        }
        return res;
    }
}
