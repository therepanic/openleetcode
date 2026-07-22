public class Solution {
    public int MinJumps(int[] arr) {
        int n = arr.Length;
        if (n == 1) return 0;
        
        Dictionary<int, List<int>> mp = new Dictionary<int, List<int>>();
        for (int i = 0; i < n; i++) {
            if (!mp.ContainsKey(arr[i])) {
                mp[arr[i]] = new List<int>();
            }
            mp[arr[i]].Add(i);
        }
        
        Queue<(int, int)> q = new Queue<(int, int)>();
        q.Enqueue((0, 0));
        bool[] vis = new bool[n];
        vis[0] = true;
        
        while (q.Count > 0) {
            var (node, dist) = q.Dequeue();
            if (node == n - 1) return dist;
            
            if (node - 1 >= 0 && !vis[node - 1]) {
                vis[node - 1] = true;
                q.Enqueue((node - 1, dist + 1));
            }
            if (node + 1 < n && !vis[node + 1]) {
                vis[node + 1] = true;
                q.Enqueue((node + 1, dist + 1));
            }
            
            if (mp.ContainsKey(arr[node])) {
                foreach (int nxt in mp[arr[node]]) {
                    if (!vis[nxt]) {
                        vis[nxt] = true;
                        q.Enqueue((nxt, dist + 1));
                    }
                }
                mp[arr[node]].Clear();
            }
        }
        return -1;
    }
}
