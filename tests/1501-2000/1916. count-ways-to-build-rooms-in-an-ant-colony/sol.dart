class Solution {
  static const int _mod = 1000000007;

  int waysToBuildRooms(List<int> prevRoom) {
    final n = prevRoom.length;
    final children = List.generate(n, (_) => <int>[]);
    for (var room = 1; room < n; room++) {
      children[prevRoom[room]].add(room);
    }

    final factorial = List<int>.filled(n + 1, 1);
    final inverseFactorial = List<int>.filled(n + 1, 1);
    for (var i = 1; i <= n; i++) {
      factorial[i] = (factorial[i - 1] * i) % _mod;
    }
    inverseFactorial[n] = _pow(factorial[n], _mod - 2);
    for (var i = n; i > 0; i--) {
      inverseFactorial[i - 1] = (inverseFactorial[i] * i) % _mod;
    }

    final order = <int>[0];
    for (var i = 0; i < order.length; i++) {
      order.addAll(children[order[i]]);
    }
    final size = List<int>.filled(n, 1);
    final ways = List<int>.filled(n, 1);
    for (var index = order.length - 1; index >= 0; index--) {
      final node = order[index];
      for (final child in children[node]) {
        ways[node] = (ways[node] * ways[child]) % _mod;
        ways[node] = (ways[node] * inverseFactorial[size[child]]) % _mod;
        size[node] += size[child];
      }
      ways[node] = (ways[node] * factorial[size[node] - 1]) % _mod;
    }
    return ways[0];
  }

  int _pow(int base, int exponent) {
    var result = 1;
    while (exponent > 0) {
      if ((exponent & 1) != 0) result = (result * base) % _mod;
      base = (base * base) % _mod;
      exponent >>= 1;
    }
    return result;
  }
}
