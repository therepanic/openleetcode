public class Solution {
    public int GetXORSum(int[] arr1, int[] arr2) {
        int x = 0, y = 0;
        foreach (int v in arr1) {
            x ^= v;
        }
        foreach (int v in arr2) {
            y ^= v;
        }
        return x & y;
    }
}
