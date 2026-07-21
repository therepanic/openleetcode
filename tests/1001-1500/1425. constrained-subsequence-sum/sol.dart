class Solution {
  int constrainedSubsetSum(List<int> nums, int k) {
    var q = <List<int>>[];
    var res = -1 << 63;
    for (var i = 0; i < nums.length; i++) {
        var num = nums[i];
        var total = q.isEmpty ? num : num + q.first[1];
        if (total > res) res = total;
        while (q.isNotEmpty && total >= q.last[1]) {
            q.removeLast();
        }
        if (total > 0) {
            q.add([i, total]);
        }
        if (q.isNotEmpty && q.first[0] == i - k) {
            q.removeAt(0);
        }
    }
    return res;
  }
}
