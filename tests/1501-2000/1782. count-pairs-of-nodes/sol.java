import java.util.*;

class Solution {
    public int[] countPairs(int n, int[][] edges, int[] queries) {
        Map<Integer, Set<Integer>> x = new HashMap<>();
        int[] edge = new int[n];
        Map<String, Integer> edgePair = new HashMap<>();

        for (int[] e : edges) {
            int i = e[0] - 1, j = e[1] - 1;
            x.computeIfAbsent(i, k -> new HashSet<>()).add(j);
            x.computeIfAbsent(j, k -> new HashSet<>()).add(i);
            edge[i]++;
            edge[j]++;
            edgePair.merge(i + "," + j, 1, Integer::sum);
            edgePair.merge(j + "," + i, 1, Integer::sum);
        }
        
        int[] res = edge.clone();
        Arrays.sort(res);
        
        int[] result = new int[queries.length];
        for (int qi = 0; qi < queries.length; qi++) {
            int query = queries[qi];
            Set<Integer> v = new HashSet<>();
            int[] ans = {0};
            
            java.util.function.IntConsumer f = new java.util.function.IntConsumer() {
                @Override
                public void accept(int i) {
                    v.add(i);
                    int a = binse(query - edge[i], res, n);
                    
                    if (edge[i] > query - edge[i]) {
                        a--;
                    }
                    
                    for (int j : x.getOrDefault(i, Collections.emptySet())) {
                        if (edge[j] > query - edge[i] && edge[j] - edgePair.getOrDefault(i + "," + j, 0) <= query - edge[i]) {
                            a--;
                        }
                        if (!v.contains(j)) {
                            accept(j);
                        }
                    }
                    ans[0] += a;
                }
            };
            
            for (int j = 0; j < n; j++) {
                if (!v.contains(j)) {
                    f.accept(j);
                }
            }
            result[qi] = ans[0] / 2;
        }
        return result;
    }
    
    private int binse(int threshold, int[] res, int n) {
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
}
