public class Solution {
    public int FindRadius(int[] houses, int[] heaters) {
        Array.Sort(houses);
        Array.Sort(heaters);
        int radius = 0;
        foreach (int house in houses) {
            int left = 0, right = heaters.Length - 1;
            while (left < right) {
                int mid = (left + right) / 2;
                if (heaters[mid] < house) {
                    left = mid + 1;
                } else {
                    right = mid;
                }
            }
            int dist = Math.Abs(heaters[left] - house);
            if (left > 0) {
                dist = Math.Min(dist, Math.Abs(heaters[left - 1] - house));
            }
            radius = Math.Max(radius, dist);
        }
        return radius;
    }
}
