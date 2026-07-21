public class Solution {
    public int[] FindDiagonalOrder(IList<IList<int>> nums) {
        List<int[]> l = new List<int[]>();
        for (int i = 0; i < nums.Count; i++) {
            for (int j = 0; j < nums[i].Count; j++) {
                l.Add(new int[]{i + j, i, j});
            }
        }

        SortedDictionary<int, List<int>> h = new SortedDictionary<int, List<int>>();
        foreach (var triple in l) {
            int sum = triple[0], i = triple[1], j = triple[2];
            if (!h.ContainsKey(sum)) h[sum] = new List<int>();
            h[sum].Add(nums[i][j]);
        }

        List<int> result = new List<int>();
        foreach (var kvp in h) {
            var diag = kvp.Value;
            for (int k = diag.Count - 1; k >= 0; k--) {
                result.Add(diag[k]);
            }
        }
        return result.ToArray();
    }
}
