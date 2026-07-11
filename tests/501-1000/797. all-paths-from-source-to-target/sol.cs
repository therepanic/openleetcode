public class Solution {
    public IList<IList<int>> AllPathsSourceTarget(int[][] graph) {
        int target = graph.Length - 1;
        IList<IList<int>> result = new List<IList<int>>();
        Queue<(int, List<int>)> queue = new Queue<(int, List<int>)>();
        queue.Enqueue((0, new List<int> { 0 }));
        
        while (queue.Count > 0) {
            var (node, path) = queue.Dequeue();
            
            if (node == target) {
                result.Add(new List<int>(path));
                continue;
            }
            
            foreach (int neighbor in graph[node]) {
                var newPath = new List<int>(path);
                newPath.Add(neighbor);
                queue.Enqueue((neighbor, newPath));
            }
        }
        
        return result;
    }
}
