import java.util.*;

class Solution {
    public int[] countSubgraphsForEachDiameter(int n, int[][] edges) {
        List<List<Integer>> graph = new ArrayList<>();
        for (int i = 0; i < n; i++) graph.add(new ArrayList<>());
        for (int[] e : edges) {
            int u = e[0] - 1, v = e[1] - 1;
            graph.get(u).add(v);
            graph.get(v).add(u);
        }
        int[] answer = new int[n - 1];
        for (int mask = 1; mask < (1 << n); mask++) {
            if (Integer.bitCount(mask) <= 1) continue;
            int b = mask & -mask;
            int s = Integer.numberOfTrailingZeros(b);
            boolean[] seen = new boolean[n];
            seen[s] = true;
            int cnt = 1;
            Queue<Integer> q = new LinkedList<>();
            q.add(s);
            while (!q.isEmpty()) {
                int u = q.poll();
                for (int v : graph.get(u)) {
                    if (((mask >> v) & 1) == 1 && !seen[v]) {
                        seen[v] = true;
                        cnt++;
                        q.add(v);
                    }
                }
            }
            if (cnt != Integer.bitCount(mask)) continue;
            int[] bfsRes = bfs(mask, s, graph, n);
            int[] bfsRes2 = bfs(mask, bfsRes[0], graph, n);
            if (bfsRes2[1] >= 1) answer[bfsRes2[1] - 1]++;
        }
        return answer;
    }
    
    private int[] bfs(int mask, int start, List<List<Integer>> graph, int n) {
        int[] dist = new int[n];
        Arrays.fill(dist, -1);
        dist[start] = 0;
        Queue<Integer> q = new LinkedList<>();
        q.add(start);
        int last = start;
        while (!q.isEmpty()) {
            int u = q.poll();
            last = u;
            for (int v : graph.get(u)) {
                if (((mask >> v) & 1) == 1 && dist[v] == -1) {
                    dist[v] = dist[u] + 1;
                    q.add(v);
                }
            }
        }
        return new int[]{last, dist[last]};
    }
}
