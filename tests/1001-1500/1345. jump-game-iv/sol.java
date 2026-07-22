import java.util.*;

class Solution {
    public int minJumps(int[] arr) {
        int n = arr.length;
        if (n == 1) return 0;
        
        Map<Integer, List<Integer>> mp = new HashMap<>();
        for (int i = 0; i < n; i++) {
            mp.computeIfAbsent(arr[i], k -> new ArrayList<>()).add(i);
        }
        
        Queue<int[]> q = new LinkedList<>();
        q.add(new int[]{0, 0});
        boolean[] vis = new boolean[n];
        vis[0] = true;
        
        while (!q.isEmpty()) {
            int[] curr = q.poll();
            int node = curr[0], dist = curr[1];
            if (node == n - 1) return dist;
            
            if (node - 1 >= 0 && !vis[node - 1]) {
                vis[node - 1] = true;
                q.add(new int[]{node - 1, dist + 1});
            }
            if (node + 1 < n && !vis[node + 1]) {
                vis[node + 1] = true;
                q.add(new int[]{node + 1, dist + 1});
            }
            
            for (int nxt : mp.getOrDefault(arr[node], Collections.emptyList())) {
                if (!vis[nxt]) {
                    vis[nxt] = true;
                    q.add(new int[]{nxt, dist + 1});
                }
            }
            mp.get(arr[node]).clear();
        }
        return -1;
    }
}
