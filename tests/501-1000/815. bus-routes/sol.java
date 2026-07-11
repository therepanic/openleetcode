class Solution {
    public int numBusesToDestination(int[][] routes, int source, int target) {
        if (source == target) return 0;
        Map<Integer, Set<Integer>> adj = new HashMap<>();
        for (int bus = 0; bus < routes.length; bus++) {
            for (int location : routes[bus]) {
                adj.computeIfAbsent(location, k -> new HashSet<>()).add(bus);
            }
        }
        Queue<Integer> queue = new LinkedList<>(adj.getOrDefault(target, new HashSet<>()));
        int cost = 0;
        Set<Integer> visited = new HashSet<>();
        while (!queue.isEmpty()) {
            cost++;
            int size = queue.size();
            for (int i = 0; i < size; i++) {
                int node = queue.poll();
                visited.add(node);
                for (int location : routes[node]) {
                    if (location == source) return cost;
                }
                for (int location : routes[node]) {
                    for (int bus : adj.getOrDefault(location, new HashSet<>())) {
                        if (!visited.contains(bus)) {
                            queue.offer(bus);
                        }
                    }
                }
            }
        }
        return -1;
    }
}
