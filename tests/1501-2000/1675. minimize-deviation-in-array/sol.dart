class Solution {
  int minimumDeviation(List<int> nums) {
    if (nums.isEmpty) return 1 << 31 - 1;
    
    final maxHeap = PriorityQueue<int>((a, b) => b.compareTo(a));
    var minVal = 1 << 31 - 1;
    
    for (var num in nums) {
      if (num % 2 == 0) {
        maxHeap.add(num);
        minVal = num < minVal ? num : minVal;
      } else {
        maxHeap.add(num * 2);
        minVal = num * 2 < minVal ? num * 2 : minVal;
      }
    }
    
    var res = 1 << 31 - 1;
    while (maxHeap.first % 2 == 0) {
      var maxVal = maxHeap.removeFirst();
      res = (maxVal - minVal) < res ? maxVal - minVal : res;
      var newNum = maxVal ~/ 2;
      maxHeap.add(newNum);
      minVal = newNum < minVal ? newNum : minVal;
    }
    
    res = (maxHeap.first - minVal) < res ? maxHeap.first - minVal : res;
    return res;
  }
}
