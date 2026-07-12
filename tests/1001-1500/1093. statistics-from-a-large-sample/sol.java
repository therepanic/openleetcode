class Solution {
    public double[] sampleStats(int[] count) {
        int tot = 0;
        long cnt = 0;
        Integer mini = null;
        int maxi = 0;
        int mode = 0;
        int modeCnt = 0;

        for (int v = 0; v < count.length; v++) {
            int c = count[v];
            if (c > 0) {
                if (mini == null) {
                    mini = v;
                }
                maxi = v;
                tot += c;
                cnt += (long) v * c;
                if (c > modeCnt) {
                    modeCnt = c;
                    mode = v;
                }
            }
        }

        double m;
        if (tot % 2 == 1) {
            m = kth(count, tot / 2 + 1);
        } else {
            m = (kth(count, tot / 2) + kth(count, tot / 2 + 1)) / 2.0;
        }

        return new double[]{(double) mini, (double) maxi, (double) cnt / tot, m, (double) mode};
    }

    private int kth(int[] count, int k) {
        int acc = 0;
        for (int v = 0; v < count.length; v++) {
            acc += count[v];
            if (acc >= k) {
                return v;
            }
        }
        return 0;
    }
}
