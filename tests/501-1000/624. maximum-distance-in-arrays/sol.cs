public class Solution {
    public int MaxDistance(IList<IList<int>> arrays) {
        int smallest = arrays[0][0];
        int largest = arrays[0][arrays[0].Count - 1];
        int ans = 0;
        for (int i = 1; i < arrays.Count; i++) {
            int curMin = arrays[i][0];
            int curMax = arrays[i][arrays[i].Count - 1];
            ans = Math.Max(ans, Math.Max(largest - curMin, curMax - smallest));
            smallest = Math.Min(curMin, smallest);
            largest = Math.Max(curMax, largest);
        }
        return ans;
    }
}
