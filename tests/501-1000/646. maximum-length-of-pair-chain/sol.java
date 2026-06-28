class Solution {
    public int findLongestChain(int[][] pairs) {
        java.util.Arrays.sort(pairs, (a, b) -> Integer.compare(a[1], b[1]));
        int[] prev = pairs[0];
        int res = 1;
        for (int i = 1; i < pairs.length; i++) {
            int[] cur = pairs[i];
            if (cur[0] > prev[1]) {
                res++;
                prev = cur;
            }
        }
        return res;
    }
}
