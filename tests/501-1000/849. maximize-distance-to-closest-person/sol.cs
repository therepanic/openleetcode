public class Solution {
    public int MaxDistToClosest(int[] seats) {
        string s = string.Join("", seats);
        string[] parts = s.Split('1');
        int maxVal = 0;
        foreach (string p in parts) maxVal = Math.Max(maxVal, p.Length);
        return Math.Max(Math.Max(parts[0].Length, (maxVal + 1) / 2), parts[parts.Length - 1].Length);
    }
}
