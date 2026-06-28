class Solution {
  int calPoints(List<String> operations) {
    List<int> stack = [];
    for (var op in operations) {
      if (op == "C") {
        stack.removeLast();
      } else if (op == "D") {
        stack.add(stack.last * 2);
      } else if (op == "+") {
        stack.add(stack.last + stack[stack.length - 2]);
      } else {
        stack.add(int.parse(op));
      }
    }
    return stack.fold(0, (sum, e) => sum + e);
  }
}
