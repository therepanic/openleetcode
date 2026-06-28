import java.util.*;

class Solution {
    public int findCheapestPrice(int n, int[][] flights, int src, int dst, int k) {
        Map<Integer, List<int[]>> matrix = new HashMap<>();
        for (int i = 0; i < n; i++) {
            matrix.put(i, new ArrayList<>());
        }
        for (int[] flight : flights) {
            int u = flight[0], v = flight[1], w = flight[2];
            matrix.get(u).add(new int[]{v, w});
        }

        int[] distance = new int[n];
        Arrays.fill(distance, Integer.MAX_VALUE);
        distance[src] = 0;

        Queue<int[]> queue = new LinkedList<>();
        queue.offer(new int[]{src, 0});
        int steps = 0;

        while (!queue.isEmpty()) {
            int level = queue.size();
            if (steps == k + 1) {
                break;
            }
            steps++;

            for (int i = 0; i < level; i++) {
                int[] curr = queue.poll();
                int node = curr[0], dist = curr[1];

                List<int[]> neighbors = matrix.get(node);
                if (neighbors == null) continue;
                for (int[] neighbor : neighbors) {
                    int v = neighbor[0], w = neighbor[1];
                    if (w + dist < distance[v]) {
                        distance[v] = w + dist;
                        queue.offer(new int[]{v, dist + w});
                    }
                }
            }
        }

        return distance[dst] == Integer.MAX_VALUE ? -1 : distance[dst];
    }
}
