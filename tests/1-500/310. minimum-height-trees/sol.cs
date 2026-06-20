public class Solution {
    public IList<int> FindMinHeightTrees(int n, int[][] edges) {
        if (n < 3) {
            return Enumerable.Range(0, n).ToList();
        }

        List<HashSet<int>> adjacencyList = new List<HashSet<int>>(n);
        for (int i = 0; i < n; i++) {
            adjacencyList.Add(new HashSet<int>());
        }
        foreach (var edge in edges) {
            int a = edge[0], b = edge[1];
            adjacencyList[a].Add(b);
            adjacencyList[b].Add(a);
        }

        List<int> leaves = new List<int>();
        for (int i = 0; i < n; i++) {
            if (adjacencyList[i].Count == 1) {
                leaves.Add(i);
            }
        }

        int remainingNodes = n;
        while (remainingNodes > 2) {
            remainingNodes -= leaves.Count;
            List<int> newLeaves = new List<int>();
            foreach (int leaf in leaves) {
                int neighbor = adjacencyList[leaf].First();
                adjacencyList[neighbor].Remove(leaf);
                if (adjacencyList[neighbor].Count == 1) {
                    newLeaves.Add(neighbor);
                }
            }
            leaves = newLeaves;
        }

        return leaves;
    }
}
