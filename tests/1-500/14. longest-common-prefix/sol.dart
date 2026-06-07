class Solution {
  String longestCommonPrefix(List<String> strs) {
    if (strs.isEmpty) return '';
    strs.sort();
    final first = strs.first;
    final last = strs.last;
    var i = 0;
    while (i < first.length && i < last.length && first[i] == last[i]) {
      i++;
    }
    return first.substring(0, i);
  }
}
