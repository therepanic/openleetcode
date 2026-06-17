public class Solution {
    public IList<IList<int>> KSmallestPairs(int[] nums1, int[] nums2, int k) {
        var result = new List<IList<int>>();
        if (nums1.Length == 0 || nums2.Length == 0) {
            return result;
        }

        var comparer = Comparer<(int sum, int i, int j)>.Create((a, b) => {
            int cmp = a.sum.CompareTo(b.sum);
            if (cmp != 0) return cmp;
            cmp = a.i.CompareTo(b.i);
            if (cmp != 0) return cmp;
            return a.j.CompareTo(b.j);
        });
        var pq = new SortedSet<(int sum, int i, int j)>(comparer);
        var visited = new HashSet<string>();

        pq.Add((nums1[0] + nums2[0], 0, 0));
        visited.Add("0,0");

        while (pq.Count > 0 && result.Count < k) {
            var cur = pq.Min;
            pq.Remove(cur);
            int i = cur.i, j = cur.j;
            result.Add(new List<int> { nums1[i], nums2[j] });

            if (j + 1 < nums2.Length && visited.Add(i + "," + (j + 1))) {
                pq.Add((nums1[i] + nums2[j + 1], i, j + 1));
            }

            if (i + 1 < nums1.Length && visited.Add((i + 1) + "," + j)) {
                pq.Add((nums1[i + 1] + nums2[j], i + 1, j));
            }
        }

        return result;
    }
}
