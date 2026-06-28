public class Solution {
    public int FindLongestChain(int[][] pairs) {
        System.Array.Sort(pairs, (a, b) => a[1].CompareTo(b[1]));
        int[] prev = pairs[0];
        int res = 1;
        for (int i = 1; i < pairs.Length; i++) {
            int[] cur = pairs[i];
            if (cur[0] > prev[1]) {
                res++;
                prev = cur;
            }
        }
        return res;
    }
}
