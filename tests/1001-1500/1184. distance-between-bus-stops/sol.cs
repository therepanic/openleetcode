public class Solution {
    public int DistanceBetweenBusStops(int[] distance, int start, int destination) {
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
        foreach (int d in distance) {
            total += d;
        }
        return Math.Min(s, total - s);
    }
}
