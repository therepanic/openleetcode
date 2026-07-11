class Solution {
  List<String> braceExpansionII(String expression) {
    List<List<String>> stack = [];
    List<String> res = [];
    List<String> cur = [];
    for (int i = 0; i < expression.length; i++) {
      String v = expression[i];
      if (v.codeUnitAt(0) >= 97 && v.codeUnitAt(0) <= 122) {
        if (cur.isEmpty) {
          cur = [v];
        } else {
          cur = cur.map((c) => c + v).toList();
        }
      } else if (v == '{') {
        stack.add(res);
        stack.add(cur);
        res = [];
        cur = [];
      } else if (v == '}') {
        List<String> pre = stack.removeLast();
        List<String> preRes = stack.removeLast();
        List<String> merged = [...res, ...cur];
        if (pre.isEmpty) {
          cur = merged;
        } else {
          cur = pre.expand((p) => merged.map((c) => p + c)).toList();
        }
        res = preRes;
      } else if (v == ',') {
        res.addAll(cur);
        cur = [];
      }
    }
    Set<String> set = {...res, ...cur};
    List<String> result = set.toList();
    result.sort();
    return result;
  }
}
