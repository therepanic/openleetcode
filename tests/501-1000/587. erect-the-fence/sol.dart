class Solution {
  List<List<int>> outerTrees(List<List<int>> trees) {
    if (trees.length == 1) {
      return trees;
    }

    int cross(List<int> o, List<int> a, List<int> b) {
      return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]);
    }

    trees.sort((a, b) => a[0] == b[0] ? a[1].compareTo(b[1]) : a[0].compareTo(b[0]));

    List<List<int>> lower = [];
    for (var p in trees) {
      while (lower.length >= 2 && cross(lower[lower.length - 2], lower[lower.length - 1], p) < 0) {
        lower.removeLast();
      }
      lower.add(p);
    }

    List<List<int>> upper = [];
    for (var p in trees.reversed) {
      while (upper.length >= 2 && cross(upper[upper.length - 2], upper[upper.length - 1], p) < 0) {
        upper.removeLast();
      }
      upper.add(p);
    }

    lower.removeLast();
    upper.removeLast();
    List<List<int>> fullHull = [...lower, ...upper];

    Set<String> seen = {};
    List<List<int>> result = [];
    for (var p in fullHull) {
      String key = '${p[0]},${p[1]}';
      if (!seen.contains(key)) {
        seen.add(key);
        result.add(p);
      }
    }
    return result;
  }
}
