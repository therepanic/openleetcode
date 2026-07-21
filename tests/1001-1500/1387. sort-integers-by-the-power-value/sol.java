class Solution {
    public int getKth(int lo, int hi, int k) {
        int n = hi - lo + 1;
        int[][] vc = new int[n][2];
        int idx = 0;
        for (int i = lo; i <= hi; i++) {
            int num = i;
            int count = 0;
            while (num != 1) {
                if (num % 2 == 0) {
                    num /= 2;
                } else {
                    num = 3 * num + 1;
                }
                count++;
            }
            vc[idx][0] = i;
            vc[idx][1] = count;
            idx++;
        }
        java.util.Arrays.sort(vc, (a, b) -> {
            if (a[1] != b[1]) return Integer.compare(a[1], b[1]);
            return Integer.compare(a[0], b[0]);
        });
        return vc[k - 1][0];
    }
}
