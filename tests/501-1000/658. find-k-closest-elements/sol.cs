public class Solution {
    public IList<int> FindClosestElements(int[] arr, int k, int x) {
        var list = new List<int>(arr);
        list.Sort((a, b) => {
            int da = Math.Abs(a - x);
            int db = Math.Abs(b - x);
            if (da != db) return da.CompareTo(db);
            return a.CompareTo(b);
        });
        var result = list.GetRange(0, k);
        result.Sort();
        return result;
    }
}
