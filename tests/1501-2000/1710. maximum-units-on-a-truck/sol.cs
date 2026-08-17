public class Solution {
    public int MaximumUnits(int[][] boxTypes, int truckSize) {
        Array.Sort(boxTypes, (a, b) => b[1].CompareTo(a[1]));
        int ans = 0;
        int remaining = truckSize;
        foreach (int[] box in boxTypes) {
            int quantitytaken = Math.Min(remaining, box[0]);
            ans += box[1] * quantitytaken;
            remaining -= quantitytaken;
            if (remaining == 0) break;
        }
        return ans;
    }
}
