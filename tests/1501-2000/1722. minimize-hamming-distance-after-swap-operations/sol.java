class Solution {
    public int minimumHammingDistance(int[] source, int[] target, int[][] allowedSwaps) {
        int n = source.length;
        int[] parent = new int[n];
        for (int i = 0; i < n; i++) parent[i] = i;
        
        java.util.function.IntFunction<Integer> find = new java.util.function.IntFunction<>() {
            @Override
            public Integer apply(int x) {
                if (parent[x] != x) {
                    parent[x] = apply(parent[x]);
                }
                return parent[x];
            }
        };
        
        for (int[] swap : allowedSwaps) {
            int a = swap[0], b = swap[1];
            parent[find.apply(a)] = find.apply(b);
        }
        
        java.util.Map<Integer, java.util.List<Integer>> groups = new java.util.HashMap<>();
        for (int i = 0; i < n; i++) {
            int root = find.apply(i);
            groups.computeIfAbsent(root, k -> new java.util.ArrayList<>()).add(source[i]);
        }
        java.util.Map<Integer, java.util.Map<Integer, Integer>> freqMap = new java.util.HashMap<>();
        for (java.util.Map.Entry<Integer, java.util.List<Integer>> entry : groups.entrySet()) {
            java.util.Map<Integer, Integer> freq = new java.util.HashMap<>();
            for (int val : entry.getValue()) {
                freq.put(val, freq.getOrDefault(val, 0) + 1);
            }
            freqMap.put(entry.getKey(), freq);
        }
        
        int hammingDist = 0;
        for (int i = 0; i < n; i++) {
            int root = find.apply(i);
            java.util.Map<Integer, Integer> freq = freqMap.get(root);
            int val = target[i];
            if (freq.getOrDefault(val, 0) > 0) {
                freq.put(val, freq.get(val) - 1);
            } else {
                hammingDist++;
            }
        }
        return hammingDist;
    }
}
