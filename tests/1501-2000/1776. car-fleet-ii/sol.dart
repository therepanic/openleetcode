class Solution {
  List<double> getCollisionTimes(List<List<int>> cars) {
    int n = cars.length;
    List<int> rightGreater = List.filled(n, -1);
    List<double> ans = List.filled(n, -1.0);
    List<int> stack = [];
    for (int r = n - 1; r >= 0; r--) {
      while (stack.isNotEmpty && cars[stack.last][1] >= cars[r][1]) {
        stack.removeLast();
      }
      if (stack.isNotEmpty) {
        rightGreater[r] = stack.last;
      }
      stack.add(r);
    }
    for (int r = n - 1; r >= 0; r--) {
      int collideId = rightGreater[r];
      while (collideId != -1 && ans[collideId] != -1 && ans[collideId] < (cars[collideId][0] - cars[r][0]) / (cars[r][1] - cars[collideId][1])) {
        collideId = rightGreater[collideId];
      }
      if (collideId != -1) {
        ans[r] = (cars[collideId][0] - cars[r][0]) / (cars[r][1] - cars[collideId][1]);
      }
    }
    return ans;
  }
}
