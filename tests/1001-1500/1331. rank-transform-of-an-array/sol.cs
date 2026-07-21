public class Solution {
    public int[] ArrayRankTransform(int[] arr) {
        int[] s = (int[])arr.Clone();
        Array.Sort(s);
        List<int> unique = new List<int>();
        foreach (int x in s) {
            if (unique.Count == 0 || unique[unique.Count - 1] != x) {
                unique.Add(x);
            }
        }
        for (int i = 0; i < arr.Length; i++) {
            arr[i] = BisectLeft(unique, arr[i]) + 1;
        }
        return arr;
    }
    
    private int BisectLeft(List<int> a, int x) {
        int lo = 0, hi = a.Count;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (a[mid] < x) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}
