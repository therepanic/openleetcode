class Solution {
  bool isSolvable(List<String> words, String result) {
    Set<String> zeroes = {};
    int m = 0;
    for (var word in words) {
      if (word.length > 1) {
        zeroes.add(word[0]);
      }
      m = m > word.length ? m : word.length;
    }
    if (m > result.length) return false;

    Map<String, int> d = {};
    for (var word in words + [result]) {
      for (var c in word.split('')) {
        d[c] = -1;
      }
    }
    List<String> wordsRev = words.map((w) => w.split('').reversed.join()).toList();
    String resultRev = result.split('').reversed.join();
    int R = resultRev.length;
    int N = wordsRev.length;
    Set<int> visited = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    bool rec(int wi, int ri, int rem) {
      if (ri == R) {
        return rem == 0 && (result.length == 1 || d[resultRev[R - 1]] != 0);
      }
      if (wi == N) {
        if (d[resultRev[ri]] != -1) {
          if (d[resultRev[ri]] != rem % 10) return false;
          return rec(0, ri + 1, rem ~/ 10);
        } else if (visited.contains(rem % 10)) {
          int val = rem % 10;
          visited.remove(val);
          d[resultRev[ri]] = val;
          bool ret = rec(wi, ri, rem);
          d[resultRev[ri]] = -1;
          visited.add(val);
          if (ret) return true;
        }
        return false;
      }
      if (wordsRev[wi].length <= ri) {
        return rec(wi + 1, ri, rem);
      }
      if (d[wordsRev[wi][ri]] != -1) {
        return rec(wi + 1, ri, rem + d[wordsRev[wi][ri]]!);
      }
      for (int val = 0; val < 10; val++) {
        if (visited.contains(val) && (val != 0 || !zeroes.contains(wordsRev[wi][ri]))) {
          visited.remove(val);
          d[wordsRev[wi][ri]] = val;
          bool ret = rec(wi + 1, ri, rem + val);
          d[wordsRev[wi][ri]] = -1;
          visited.add(val);
          if (ret) return true;
        }
      }
      return false;
    }

    return rec(0, 0, 0);
  }
}
