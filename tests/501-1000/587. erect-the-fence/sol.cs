public class Solution {
    public int[][] OuterTrees(int[][] trees) {
        if (trees.Length == 1) {
            return trees;
        }

        System.Array.Sort(trees, (a, b) => a[0] == b[0] ? a[1].CompareTo(b[1]) : a[0].CompareTo(b[0]));

        var lower = new System.Collections.Generic.List<int[]>();
        foreach (var p in trees) {
            while (lower.Count >= 2 && Cross(lower[lower.Count - 2], lower[lower.Count - 1], p) < 0) {
                lower.RemoveAt(lower.Count - 1);
            }
            lower.Add(p);
        }

        var upper = new System.Collections.Generic.List<int[]>();
        for (int i = trees.Length - 1; i >= 0; i--) {
            var p = trees[i];
            while (upper.Count >= 2 && Cross(upper[upper.Count - 2], upper[upper.Count - 1], p) < 0) {
                upper.RemoveAt(upper.Count - 1);
            }
            upper.Add(p);
        }

        lower.RemoveAt(lower.Count - 1);
        upper.RemoveAt(upper.Count - 1);
        lower.AddRange(upper);

        var seen = new System.Collections.Generic.HashSet<string>();
        var result = new System.Collections.Generic.List<int[]>();
        foreach (var p in lower) {
            string key = $"{p[0]},{p[1]}";
            if (!seen.Contains(key)) {
                seen.Add(key);
                result.Add(p);
            }
        }

        return result.ToArray();
    }

    private int Cross(int[] o, int[] a, int[] b) {
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]);
    }
}
