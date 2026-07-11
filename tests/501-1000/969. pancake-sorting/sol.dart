class Solution {
  List<int> pancakeSort(List<int> arr) {
    int n = arr.length;
    List<int> result = [];
    
    for (int i = 0; i < n; i++) {
      int target = n - i;
      int position = 0;
      
      for (int j = 0; j < n - i; j++) {
        if (arr[j] == target) {
          position = j;
          break;
        }
      }
      
      if (position == n - i - 1) {
        continue;
      }
      
      if (position > 0) {
        result.add(position + 1);
        _reverse(arr, 0, position);
      }
      
      result.add(n - i);
      _reverse(arr, 0, n - i - 1);
    }
    
    return result;
  }
  
  void _reverse(List<int> arr, int left, int right) {
    while (left < right) {
      int temp = arr[left];
      arr[left] = arr[right];
      arr[right] = temp;
      left++;
      right--;
    }
  }
}
