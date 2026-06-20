public class Solution {
    public int FindPoisonedDuration(int[] timeSeries, int duration) {
        int totalSecs = 0;
        int? prev = null;

        foreach (int t in timeSeries) {
            totalSecs += duration;

            if (prev.HasValue && prev.Value + duration > t) {
                totalSecs -= (prev.Value + duration - t);
            }

            prev = t;
        }

        return totalSecs;
    }
}
