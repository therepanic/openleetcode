class Solution {
    public int maxDistToClosest(int[] seats) {
        int previous = -1;
        int best = 0;
        for (int i = 0; i < seats.length; i++) {
            if (seats[i] == 1) {
                best = Math.max(best, previous == -1 ? i : (i - previous) / 2);
                previous = i;
            }
        }
        return Math.max(best, seats.length - 1 - previous);
    }
}
