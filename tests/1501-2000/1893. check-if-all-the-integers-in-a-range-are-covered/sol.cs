public class Solution {
    public bool IsCovered(int[][] ranges, int left, int right) {
        int[] slots = new int[51];
        foreach (var r in ranges) {
            int s = r[0], e = r[1];
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
