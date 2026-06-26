class Solution {
  String nearestPalindromic(String n) {
    final num = BigInt.parse(n);

    BigInt pow10(int exp) {
      var value = BigInt.one;
      for (int i = 0; i < exp; i++) {
        value *= BigInt.from(10);
      }
      return value;
    }

    String reverse(String s) => s.split('').reversed.join();

    BigInt makePalindrome(BigInt prefix) {
      final left = prefix.toString();
      final rightSource = n.length.isEven ? left : left.substring(0, left.length - 1);
      return BigInt.parse(left + reverse(rightSource));
    }

    final candidates = <BigInt>{
      pow10(n.length - 1) - BigInt.one,
      pow10(n.length) + BigInt.one,
    };
    final prefix = BigInt.parse(n.substring(0, (n.length + 1) ~/ 2));
    for (final delta in [BigInt.from(-1), BigInt.zero, BigInt.one]) {
      if (prefix + delta >= BigInt.zero) {
        candidates.add(makePalindrome(prefix + delta));
      }
    }

    BigInt? best;
    for (final candidate in candidates) {
      if (candidate == num) {
        continue;
      }
      if (best == null ||
          (candidate - num).abs() < (best - num).abs() ||
          ((candidate - num).abs() == (best - num).abs() && candidate < best)) {
        best = candidate;
      }
    }

    return best.toString();
  }
}
