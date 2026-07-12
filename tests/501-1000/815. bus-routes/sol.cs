public class Solution {
    public int NumBusesToDestination(int[][] routes, int source, int target) {
        if (source == target) return 0;
        Dictionary<int, HashSet<int>> adj = new Dictionary<int, HashSet<int>>();
        for (int bus = 0; bus < routes.Length; bus++) {
            foreach (int location in routes[bus]) {
                if (!adj.ContainsKey(location)) adj[location] = new HashSet<int>();
                adj[location].Add(bus);
            }
        }
        Queue<int> queue = new Queue<int>();
        if (adj.ContainsKey(target)) {
            foreach (int bus in adj[target]) {
                queue.Enqueue(bus);
            }
        }
        int cost = 0;
        HashSet<int> visited = new HashSet<int>();
        while (queue.Count > 0) {
            cost++;
            int size = queue.Count;
            for (int i = 0; i < size; i++) {
                int node = queue.Dequeue();
                visited.Add(node);
                if (Array.IndexOf(routes[node], source) != -1) return cost;
                foreach (int location in routes[node]) {
                    if (adj.ContainsKey(location)) {
                        foreach (int bus in adj[location]) {
                            if (!visited.Contains(bus)) {
                                queue.Enqueue(bus);
                            }
                        }
                    }
                }
            }
        }
        return -1;
    }
}
