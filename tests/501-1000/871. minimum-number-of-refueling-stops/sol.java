class Solution {
    public int minRefuelStops(int target, int startFuel, int[][] stations) {
        java.util.PriorityQueue<Integer> heap = new java.util.PriorityQueue<>((a, b) -> b - a);
        int fuel = startFuel;
        int count = 0;
        int i = 0;
        int n = stations.length;
        int[][] extended = new int[n + 1][2];
        System.arraycopy(stations, 0, extended, 0, n);
        extended[n] = new int[]{target, 0};
        while (i < extended.length) {
            if (fuel >= target) return count;
            while (i < extended.length && extended[i][0] <= fuel) {
                heap.offer(extended[i][1]);
                i++;
            }
            if (heap.isEmpty()) return -1;
            fuel += heap.poll();
            count++;
        }
        return -1;
    }
}
