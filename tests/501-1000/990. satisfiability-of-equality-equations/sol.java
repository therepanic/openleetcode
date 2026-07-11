class Solution {
    public boolean equationsPossible(String[] equations) {
        int[] parent = new int[26];
        int[] rank = new int[26];
        for (int i = 0; i < 26; i++) {
            parent[i] = i;
        }

        for (String eq : equations) {
            if (eq.charAt(1) == '=') {
                union(eq.charAt(0) - 'a', eq.charAt(3) - 'a', parent, rank);
            }
        }

        for (String eq : equations) {
            if (eq.charAt(1) == '!' && find(eq.charAt(0) - 'a', parent) == find(eq.charAt(3) - 'a', parent)) {
                return false;
            }
        }
        return true;
    }

    private int find(int x, int[] parent) {
        if (parent[x] != x) {
            parent[x] = find(parent[x], parent);
        }
        return parent[x];
    }

    private void union(int a, int b, int[] parent, int[] rank) {
        int ra = find(a, parent);
        int rb = find(b, parent);
        if (ra == rb) return;
        if (rank[ra] < rank[rb]) {
            parent[ra] = rb;
        } else if (rank[ra] > rank[rb]) {
            parent[rb] = ra;
        } else {
            parent[rb] = ra;
            rank[ra]++;
        }
    }
}
