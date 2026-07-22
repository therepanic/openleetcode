class Solution {
    public int distanceBetweenBusStops(int[] distance, int start, int destination) {
        if (destination < start) {
            int temp = start;
            start = destination;
            destination = temp;
        }
        int s = 0;
        for (int i = start; i < destination; i++) {
            s += distance[i];
        }
        int total = 0;
        for (int d : distance) {
            total += d;
        }
        return Math.min(s, total - s);
    }
}
