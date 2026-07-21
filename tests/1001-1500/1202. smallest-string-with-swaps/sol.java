class Solution {
    public String smallestStringWithSwaps(String s, int[][] pairs) {
        int n = s.length();
        int[] parent = new int[n];
        for (int i = 0; i < n; i++) {
            parent[i] = i;
        }
        
        for (int[] pair : pairs) {
            int x = pair[0], y = pair[1];
            union(parent, x, y);
        }
        
        Map<Integer, List<Integer>> groups = new HashMap<>();
        for (int i = 0; i < n; i++) {
            int root = find(parent, i);
            groups.computeIfAbsent(root, k -> new ArrayList<>()).add(i);
        }
        
        char[] res = new char[n];
        for (List<Integer> indices : groups.values()) {
            List<Character> chars = new ArrayList<>();
            for (int idx : indices) {
                chars.add(s.charAt(idx));
            }
            Collections.sort(indices);
            Collections.sort(chars);
            for (int k = 0; k < indices.size(); k++) {
                res[indices.get(k)] = chars.get(k);
            }
        }
        
        return new String(res);
    }
    
    private int find(int[] parent, int x) {
        if (parent[x] != x) {
            parent[x] = find(parent, parent[x]);
        }
        return parent[x];
    }
    
    private void union(int[] parent, int x, int y) {
        int rx = find(parent, x);
        int ry = find(parent, y);
        if (rx != ry) {
            parent[rx] = ry;
        }
    }
}
