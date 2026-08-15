class Solution {
    public boolean isCovered(int[][] ranges, int left, int right) {
        int[] slots = new int[51];
        for (int[] range : ranges) {
            int s = range[0], e = range[1];
            for (int i = s; i <= e; i++) {
                slots[i] = 1;
            }
        }
        for (int i = left; i <= right; i++) {
            if (slots[i] == 0) return false;
        }
        return true;
    }
}
