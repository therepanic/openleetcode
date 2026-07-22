class UnionFind {
  List<int> parent;
  UnionFind(int n) : parent = List.generate(n, (i) => i);
  int findParent(int p) => parent[p] == p ? p : parent[p] = findParent(parent[p]);
  void union(int u, int v) => parent[findParent(u)] = findParent(v);
}

class Solution {
  List<List<int>> findCriticalAndPseudoCriticalEdges(int n, List<List<int>> edges) {

    int findMST(int block, int e) {
      UnionFind uf = UnionFind(n);
      int weight = 0;
      if (e != -1) {
        weight += edges[e][2];
        uf.union(edges[e][0], edges[e][1]);
      }
      for (int i = 0; i < edges.length; i++) {
        if (i == block) continue;
        if (uf.findParent(edges[i][0]) == uf.findParent(edges[i][1])) continue;
        uf.union(edges[i][0], edges[i][1]);
        weight += edges[i][2];
      }
      for (int i = 0; i < n; i++) {
        if (uf.findParent(i) != uf.findParent(0)) return 2147483647;
      }
      return weight;
    }

    for (int i = 0; i < edges.length; i++) {
      edges[i].add(i);
    }
    edges.sort((a, b) => a[2].compareTo(b[2]));
    int mstwt = findMST(-1, -1);
    List<int> critical = [];
    List<int> pseudoCritical = [];
    for (int i = 0; i < edges.length; i++) {
      if (mstwt < findMST(i, -1)) {
        critical.add(edges[i][3]);
      } else if (mstwt == findMST(-1, i)) {
        pseudoCritical.add(edges[i][3]);
      }
    }
    return [critical, pseudoCritical];
  }
}
