class Solution {
  int numSpecialEquivGroups(List<String> words) {
    var seen = <String>{};
    for (var w in words) {
      var even = <String>[];
      var odd = <String>[];
      for (var i = 0; i < w.length; i++) {
        if (i % 2 == 0) {
          even.add(w[i]);
        } else {
          odd.add(w[i]);
        }
      }
      even.sort();
      odd.sort();
      seen.add(even.join() + ',' + odd.join());
    }
    return seen.length;
  }
}
