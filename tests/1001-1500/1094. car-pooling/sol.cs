public class Solution {
    public bool CarPooling(int[][] trips, int capacity) {
        int[] diff = new int[1001];
        foreach (var trip in trips) {
            int num = trip[0], start = trip[1], end = trip[2];
            diff[start] += num;
            diff[end] -= num;
        }
        int curr = 0;
        foreach (int delta in diff) {
            curr += delta;
            if (curr > capacity) {
                return false;
            }
        }
        return true;
    }
}
