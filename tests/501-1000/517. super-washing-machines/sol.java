class Solution {
    public int findMinMoves(int[] machines) {
        int n = machines.length;
        int total = 0;
        for (int m : machines) {
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
        for (int i = 0; i < n; i++) {
            res = Math.max(res, Math.abs(d));
            res = Math.max(res, imbalances[i]);
            d += imbalances[i];
        }
        return res;
    }
}
