class Solution {
  bool canReach(List<int> arr, int start) {
    var seen = <int>{};
    var queue = <int>[start];
    var head = 0;
    while (head < queue.length) {
      var index = queue[head];
      head++;
      if (index < 0 || index >= arr.length || seen.contains(index)) {
        continue;
      }
      if (arr[index] == 0) {
        return true;
      }
      seen.add(index);
      queue.add(index + arr[index]);
      queue.add(index - arr[index]);
    }
    return false;
  }
}
