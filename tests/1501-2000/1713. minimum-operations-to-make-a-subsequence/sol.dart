class Solution {
  int minOperations(List<int> target, List<int> arr) {
    Map<int, int> targetIndexMap = {};
    for (int i = 0; i < target.length; i++) {
      targetIndexMap[target[i]] = i;
    }
    
    List<int> transformedArr = [];
    for (int num in arr) {
      if (targetIndexMap.containsKey(num)) {
        transformedArr.add(targetIndexMap[num]!);
      }
    }
    
    List<int> lis = [];
    for (int index in transformedArr) {
      int pos = lowerBound(lis, index);
      if (pos == lis.length) {
        lis.add(index);
      } else {
        lis[pos] = index;
      }
    }
    
    return target.length - lis.length;
  }
  
  int lowerBound(List<int> list, int target) {
    int low = 0, high = list.length;
    while (low < high) {
      int mid = (low + high) ~/ 2;
      if (list[mid] < target) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    return low;
  }
}
