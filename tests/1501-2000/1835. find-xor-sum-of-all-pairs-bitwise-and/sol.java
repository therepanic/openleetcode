class Solution {
    public int getXORSum(int[] arr1, int[] arr2) {
        int x = 0, y = 0;
        for (int v : arr1) {
            x ^= v;
        }
        for (int v : arr2) {
            y ^= v;
        }
        return x & y;
    }
}
