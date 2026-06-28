public class Solution {
    public int LeastBricks(IList<IList<int>> wall) {
        Dictionary<int, int> edgeCounts = new Dictionary<int, int>();
        foreach (var row in wall) {
            int edge = 0;
            for (int i = 0; i < row.Count - 1; i++) {
                edge += row[i];
                if (edgeCounts.ContainsKey(edge)) {
                    edgeCounts[edge]++;
                } else {
                    edgeCounts[edge] = 1;
                }
            }
        }
        int maxEdges = 0;
        foreach (var count in edgeCounts.Values) {
            maxEdges = Math.Max(maxEdges, count);
        }
        return wall.Count - maxEdges;
    }
}
