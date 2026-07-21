class Solution {
  List<int> getStrongest(List<int> arr, int k) {
    arr.sort();
    int m = arr[(arr.length - 1) ~/ 2];
    
    int left = 0, right = arr.length - 1;
    List<int> result = [];
    for (int i = 0; i < k; i++) {
      if ((arr[right] - m).abs() >= (arr[left] - m).abs()) {
        result.add(arr[right]);
        right--;
      } else {
        result.add(arr[left]);
        left++;
      }
    }
    return result;
  }
}
