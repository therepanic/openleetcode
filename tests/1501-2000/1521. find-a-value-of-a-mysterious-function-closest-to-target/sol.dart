class Solution {
  int closestToTarget(List<int> arr, int target) {
    var answer = 1 << 60;
    var previous = <int>[];
    for (final value in arr) {
      final current = <int>[value];
      for (final old in previous) {
        final candidate = old & value;
        if (candidate != current.last) current.add(candidate);
      }
      for (final candidate in current) {
        final difference = (candidate - target).abs();
        if (difference < answer) answer = difference;
      }
      previous = current;
    }
    return answer;
  }
}
