class Solution {
  int findMaxValueOfEquation(List<List<int>> points, int k) {
    var window = <List<int>>[];
    var answer = -1000000000000000000;
    for (var point in points) {
      var x = point[0];
      var y = point[1];
      while (window.isNotEmpty && x - window.first[1] > k) {
        window.removeAt(0);
      }
      if (window.isNotEmpty) {
        var current = x + y + window.first[0];
        if (current > answer) {
          answer = current;
        }
      }
      var value = y - x;
      while (window.isNotEmpty && window.last[0] <= value) {
        window.removeLast();
      }
      window.add([value, x]);
    }
    return answer;
  }
}
