public class Solution {
    public int[] ProcessQueries(int[] queries, int m) {
        int[] ans = new int[queries.Length];
        List<int> arr = new List<int>();
        for (int i = 1; i <= m; i++) {
            arr.Add(i);
        }
        for (int i = 0; i < queries.Length; i++) {
            int x = queries[i];
            int idx = arr.IndexOf(x);
            ans[i] = idx;
            arr.RemoveAt(idx);
            arr.Insert(0, x);
        }
        return ans;
    }
}
