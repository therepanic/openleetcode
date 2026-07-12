public class Solution {
    public int NumEquivDominoPairs(int[][] dominoes) {
        int[] mpp = new int[100];
        int count = 0;
        foreach (int[] d in dominoes) {
            int a = d[0], b = d[1];
            int key = a <= b ? a * 10 + b : b * 10 + a;
            count += mpp[key];
            mpp[key]++;
        }
        return count;
    }
}
