class Solution {
  bool mergeTriplets(List<List<int>> triplets, List<int> target) {
    for (var t in triplets) {
      if (t[0] == target[0] && t[1] == target[1] && t[2] == target[2]) {
        return true;
      }
    }
    var curr = [0, 0, 0];
    for (var t in triplets) {
      var flag = false;
      if (target[0] == t[0] && curr[0] != target[0]) {
        flag = true;
      }
      if (target[1] == t[1] && curr[1] != target[1]) {
        flag = true;
      }
      if (target[2] == t[2] && curr[2] != target[2]) {
        flag = true;
      }
      if (flag) {
        var temp = List<int>.from(curr);
        curr[0] = [curr[0], t[0]].reduce((a, b) => a > b ? a : b);
        curr[1] = [curr[1], t[1]].reduce((a, b) => a > b ? a : b);
        curr[2] = [curr[2], t[2]].reduce((a, b) => a > b ? a : b);
        if (curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2]) {
          curr = temp;
        }
      }
    }
    return curr[0] == target[0] && curr[1] == target[1] && curr[2] == target[2];
  }
}
