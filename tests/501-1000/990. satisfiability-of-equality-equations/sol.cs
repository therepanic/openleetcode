public class Solution {
    public bool EquationsPossible(string[] equations) {
        int[] parent = new int[26];
        int[] rank = new int[26];
        for (int i = 0; i < 26; i++) {
            parent[i] = i;
        }

        int Find(int x) {
            if (parent[x] != x) {
                parent[x] = Find(parent[x]);
            }
            return parent[x];
        }

        void Union(int a, int b) {
            int ra = Find(a);
            int rb = Find(b);
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

        foreach (string eq in equations) {
            if (eq[1] == '=') {
                Union(eq[0] - 'a', eq[3] - 'a');
            }
        }

        foreach (string eq in equations) {
            if (eq[1] == '!' && Find(eq[0] - 'a') == Find(eq[3] - 'a')) {
                return false;
            }
        }
        return true;
    }
}
