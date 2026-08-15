public class Solution {
    public IList<int> FindSmallestSetOfVertices(int n, IList<IList<int>> edges) {
        bool[] hasIncoming = new bool[n];
        foreach (var edge in edges) {
            hasIncoming[edge[1]] = true;
        }
        var result = new List<int>();
        for (int i = 0; i < n; i++) {
            if (!hasIncoming[i]) {
                result.Add(i);
            }
        }
        return result;
    }
}
