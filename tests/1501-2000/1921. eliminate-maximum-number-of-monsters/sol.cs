public class Solution {
    public int EliminateMaximum(int[] dist, int[] speed) {
        int n = dist.Length;
        int[] arrival = new int[n];
        for (int i = 0; i < n; i++) {
            arrival[i] = (dist[i] + speed[i] - 1) / speed[i];
        }
        Array.Sort(arrival);
        for (int minute = 0; minute < n; minute++) {
            if (arrival[minute] <= minute) {
                return minute;
            }
        }
        return n;
    }
}
