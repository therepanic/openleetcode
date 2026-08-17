class Solution {
    public int eliminateMaximum(int[] dist, int[] speed) {
        int n = dist.length;
        int[] arrival = new int[n];
        for (int i = 0; i < n; i++) {
            arrival[i] = (dist[i] + speed[i] - 1) / speed[i];
        }
        Arrays.sort(arrival);
        for (int minute = 0; minute < n; minute++) {
            if (arrival[minute] <= minute) {
                return minute;
            }
        }
        return n;
    }
}
