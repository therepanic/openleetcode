class Solution {
  int minMutation(String startGene, String endGene, List<String> bank) {
    var s = bank.toSet();
    if (!s.contains(endGene) && startGene != endGene) return -1;
    var q = Queue<List<dynamic>>();
    q.add([startGene, 0]);
    var v = {startGene};
    var choices = ['A', 'C', 'G', 'T'];
    while (q.isNotEmpty) {
      var item = q.removeFirst();
      var g = item[0] as String;
      var d = item[1] as int;
      if (g == endGene) return d;
      for (var i = 0; i < 8; i++) {
        for (var c in choices) {
          if (g[i] != c) {
            var n = g.substring(0, i) + c + g.substring(i+1);
            if (s.contains(n) && !v.contains(n)) {
              v.add(n);
              q.add([n, d+1]);
            }
          }
        }
      }
    }
    return -1;
  }
}
