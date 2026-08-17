class Solution {
  int createSortedArray(List<int> instructions) {
    const int mod = 1000000007;
    final bit = List<int>.filled(100002, 0);

    void add(int index) {
      while (index < bit.length) {
        bit[index]++;
        index += index & -index;
      }
    }

    int prefix(int index) {
      var total = 0;
      while (index > 0) {
        total += bit[index];
        index -= index & -index;
      }
      return total;
    }

    var cost = 0;
    for (var i = 0; i < instructions.length; i++) {
      final value = instructions[i];
      final less = prefix(value);
      final greater = i - prefix(value + 1);
      cost = (cost + (less < greater ? less : greater)) % mod;
      add(value + 1);
    }
    return cost;
  }
}
