public class Solution {
    public int[] RestoreArray(int[][] adjacentPairs) {
        var xorMap = new Dictionary<int, int>();
        var degree = new Dictionary<int, int>();

        foreach (var pair in adjacentPairs) {
            int u = pair[0], v = pair[1];
            xorMap[u] = xorMap.GetValueOrDefault(u) ^ v;
            xorMap[v] = xorMap.GetValueOrDefault(v) ^ u;
            degree[u] = degree.GetValueOrDefault(u) + 1;
            degree[v] = degree.GetValueOrDefault(v) + 1;
        }

        int start = 0;
        foreach (var kv in degree) {
            if (kv.Value == 1) {
                start = kv.Key;
                break;
            }
        }

        int n = adjacentPairs.Length + 1;
        int[] res = new int[n];

        res[0] = start;
        int prev = 0;

        for (int i = 1; i < n; i++) {
            res[i] = xorMap[res[i - 1]] ^ prev;
            prev = res[i - 1];
        }

        return res;
    }
}
