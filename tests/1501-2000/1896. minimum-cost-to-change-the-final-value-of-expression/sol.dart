class Solution {
  int minOperationsToFlip(String expression) {
    Map<int, int> loc = {};
    List<int> stack = [];
    for (int i = expression.length - 1; i >= 0; i--) {
      if (expression[i] == ')') {
        stack.add(i);
      } else if (expression[i] == '(') {
        loc[stack.removeLast()] = i;
      }
    }
    
    List<int> fn(int lo, int hi) {
      if (lo == hi) return [expression.codeUnitAt(lo) - 48, 1];
      if (expression[hi] == ')' && loc[hi] == lo) return fn(lo + 1, hi - 1);
      int mid = (loc[hi] ?? hi) - 1;
      List<int> right = fn(mid + 1, hi);
      List<int> left = fn(lo, mid - 1);
      int v = right[0], c = right[1], vv = left[0], cc = left[1];
      int val, chg;
      if (expression[mid] == '|') {
        val = v | vv;
        if (v == 0 && vv == 0) {
          chg = c < cc ? c : cc;
        } else if (v == 1 && vv == 1) {
          chg = 1 + (c < cc ? c : cc);
        } else {
          chg = 1;
        }
      } else {
        val = v & vv;
        if (v == 0 && vv == 0) {
          chg = 1 + (c < cc ? c : cc);
        } else if (v == 1 && vv == 1) {
          chg = c < cc ? c : cc;
        } else {
          chg = 1;
        }
      }
      return [val, chg];
    }
    
    return fn(0, expression.length - 1)[1];
  }
}
