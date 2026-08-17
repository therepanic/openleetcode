class Solution {
  int minimumJumps(List<int> forbidden, int a, int b, int x) {
    int idx = 1;
    for (int i = 2; i <= (a < b ? a : b); i++) {
      if (a % i == 0 && b % i == 0) idx = i;
    }
    if (x % idx != 0) return -1;
    Queue<List<int>> q = Queue();
    q.add([0, 1, 0]);
    Set<int> visited = Set();
    visited.add(0);
    forbidden.forEach((f) => visited.add(f));
    int top = forbidden.reduce((m, e) => e > m ? e : m);
    int limit = top + x + a + b;
    while (q.isNotEmpty) {
      var cur = q.removeFirst();
      int curr = cur[0], prev = cur[1], step = cur[2];
      if (curr == x) return step;
      if (prev == 1) {
        int nb = curr - b;
        if (nb >= 0 && !visited.contains(nb)) {
          visited.add(nb);
          q.add([nb, -1, step + 1]);
        }
      }
      int na = curr + a;
      if (na <= limit && !visited.contains(na)) {
        visited.add(na);
        q.add([na, 1, step + 1]);
      }
    }
    return -1;
  }
}
