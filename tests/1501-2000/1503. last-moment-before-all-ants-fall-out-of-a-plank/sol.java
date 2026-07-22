class Solution {
    public int getLastMoment(int n, int[] left, int[] right) {
        int maxVal = 0;
        for (int value : left) {
            maxVal = Math.max(value, maxVal);
        }
        for (int value : right) {
            maxVal = Math.max(n - value, maxVal);
        }
        return maxVal;
    }
}
