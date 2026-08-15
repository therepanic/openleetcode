@SuppressWarnings("unchecked")
class Solution {
    public int minCost(int maxTime, int[][] edges, int[] passingFees) {
        int n = passingFees.length;
        List<int[]>[] graph = new ArrayList[n];
        for (int i = 0; i < n; i++) graph[i] = new ArrayList<>();
        for (int[] e : edges) {
            graph[e[0]].add(new int[]{e[1], e[2]});
            graph[e[1]].add(new int[]{e[0], e[2]});
        }
        int[] times = new int[n];
        int[] costs = new int[n];
        Arrays.fill(times, maxTime + 1);
        Arrays.fill(costs, Integer.MAX_VALUE);
        times[0] = 0;
        costs[0] = passingFees[0];
        PriorityQueue<int[]> pq = new PriorityQueue<>((a,b) -> a[0] != b[0] ? a[0] - b[0] : a[1] - b[1]);
        pq.offer(new int[]{passingFees[0], 0, 0});
        while (!pq.isEmpty()) {
            int[] cur = pq.poll();
            int cost = cur[0], time = cur[1], city = cur[2];
            if (city == n - 1) return cost;
            for (int[] nb : graph[city]) {
                int nxt = nb[0], t = nb[1];
                int nt = time + t;
                if (nt > maxTime) continue;
                int nc = cost + passingFees[nxt];
                if (nc < costs[nxt] || nt < times[nxt]) {
                    costs[nxt] = nc;
                    times[nxt] = nt;
                    pq.offer(new int[]{nc, nt, nxt});
                }
            }
        }
        return -1;
    }
}
