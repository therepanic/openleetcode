public class Solution {
    public int GetLastMoment(int n, int[] left, int[] right) {
        int maxVal = 0;
        foreach (int value in left) {
            maxVal = Math.Max(value, maxVal);
        }
        foreach (int value in right) {
            maxVal = Math.Max(n - value, maxVal);
        }
        return maxVal;
    }
}
