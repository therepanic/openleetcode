class Solution {
  bool equationsPossible(List<String> equations) {
    var parent = List.generate(26, (i) => i);
    var rank = List.filled(26, 0);

    int find(int x) {
      if (parent[x] != x) {
        parent[x] = find(parent[x]);
      }
      return parent[x];
    }

    void union(int a, int b) {
      int ra = find(a);
      int rb = find(b);
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

    for (var eq in equations) {
      if (eq[1] == '=') {
        union(eq.codeUnitAt(0) - 'a'.codeUnitAt(0), eq.codeUnitAt(3) - 'a'.codeUnitAt(0));
      }
    }

    for (var eq in equations) {
      if (eq[1] == '!' && find(eq.codeUnitAt(0) - 'a'.codeUnitAt(0)) == find(eq.codeUnitAt(3) - 'a'.codeUnitAt(0))) {
        return false;
      }
    }
    return true;
  }
}
