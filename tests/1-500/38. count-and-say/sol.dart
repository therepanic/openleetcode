class Solution {
  String countAndSay(int n) {
    var current = "1";
    for (var step = 1; step < n; step++) {
      final next = StringBuffer();
      var i = 0;
      while (i < current.length) {
        var j = i;
        while (j < current.length && current[j] == current[i]) {
          j++;
        }
        next.write(j - i);
        next.write(current[i]);
        i = j;
      }
      current = next.toString();
    }
    return current;
  }
}
