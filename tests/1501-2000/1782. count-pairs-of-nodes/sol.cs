using System;
using System.Collections.Generic;
using System.Linq;

public class Solution {
    public int[] CountPairs(int n, int[][] edges, int[] queries) {
        var x = new Dictionary<int, HashSet<int>>();
        var edge = new int[n];
        var edgePair = new Dictionary<(int, int), int>();

        foreach (var e in edges) {
            int i = e[0] - 1;
            int j = e[1] - 1;
            if (!x.ContainsKey(i)) x[i] = new HashSet<int>();
            if (!x.ContainsKey(j)) x[j] = new HashSet<int>();
            x[i].Add(j);
            x[j].Add(i);
            edge[i]++;
            edge[j]++;
            var key1 = (i, j);
            var key2 = (j, i);
            edgePair[key1] = edgePair.GetValueOrDefault(key1, 0) + 1;
            edgePair[key2] = edgePair.GetValueOrDefault(key2, 0) + 1;
        }
        
        var res = edge.OrderBy(v => v).ToArray();
        
        int Binse(int threshold) {
            int i = 0, j = n - 1;
            int ans = n;
            while (i <= j) {
                int mid = (i + j) / 2;
                if (res[mid] > threshold) {
                    ans = mid;
                    j = mid - 1;
                } else {
                    i = mid + 1;
                }
            }
            return n - ans;
        }
        
        var result = new int[queries.Length];
        for (int qi = 0; qi < queries.Length; qi++) {
            int query = queries[qi];
            var v = new HashSet<int>();
            int ans = 0;
            
            void F(int i) {
                v.Add(i);
                int a = Binse(query - edge[i]);
                
                if (edge[i] > query - edge[i]) {
                    a--;
                }
                
                foreach (int j in x.GetValueOrDefault(i, new HashSet<int>())) {
                    if (edge[j] > query - edge[i] && edge[j] - edgePair.GetValueOrDefault((i, j), 0) <= query - edge[i]) {
                        a--;
                    }
                    if (!v.Contains(j)) {
                        F(j);
                    }
                }
                ans += a;
            }
            
            for (int j = 0; j < n; j++) {
                if (!v.Contains(j)) {
                    F(j);
                }
            }
            result[qi] = ans / 2;
        }
        
        return result;
    }
}
