public class Solution {
    public int FindMinDifference(IList<string> timePoints) {
        var times = new int[timePoints.Count];
        for (int i = 0; i < timePoints.Count; i++) {
            var parts = timePoints[i].Split(':');
            int h = int.Parse(parts[0]);
            int m = int.Parse(parts[1]);
            times[i] = h * 60 + m;
        }
        Array.Sort(times);
        int minDiff = int.MaxValue;
        for (int i = 1; i < times.Length; i++) {
            minDiff = Math.Min(minDiff, times[i] - times[i - 1]);
        }
        minDiff = Math.Min(minDiff, 1440 + times[0] - times[times.Length - 1]);
        return minDiff;
    }
}
