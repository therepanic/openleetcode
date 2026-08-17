class Solution {
  int finalValueAfterOperations(List<String> operations) {
    return operations.fold(0, (sum, op) => sum + (op[1] == '+' ? 1 : -1));
  }
}
