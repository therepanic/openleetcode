class Solution {
    public int findPoisonedDuration(int[] timeSeries, int duration) {
        int totalSecs = 0;
        Integer prev = null;

        for (int t : timeSeries) {
            totalSecs += duration;

            if (prev != null && prev + duration > t) {
                totalSecs -= (prev + duration - t);
            }

            prev = t;
        }

        return totalSecs;
    }
}
