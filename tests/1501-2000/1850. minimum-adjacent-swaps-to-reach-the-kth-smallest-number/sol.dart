class Solution {
  int getMinSwaps(String num, int k) {
    List<String> arr = num.split('');
    List<String> target = num.split('');
    
    for (int i = 0; i < k; i++) {
      nextPermutation(target);
    }
    
    int swaps = 0;
    arr = num.split('');
    
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == target[i]) continue;
      
      int j = i;
      while (arr[j] != target[i]) j++;
      
      while (j > i) {
        String temp = arr[j];
        arr[j] = arr[j - 1];
        arr[j - 1] = temp;
        j--;
        swaps++;
      }
    }
    
    return swaps;
  }
  
  void nextPermutation(List<String> arr) {
    int i = arr.length - 2;
    while (i >= 0 && arr[i].compareTo(arr[i + 1]) >= 0) i--;
    if (i == -1) return;
    
    int j = arr.length - 1;
    while (arr[j].compareTo(arr[i]) <= 0) j--;
    
    String temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
    
    int left = i + 1, right = arr.length - 1;
    while (left < right) {
      temp = arr[left];
      arr[left] = arr[right];
      arr[right] = temp;
      left++;
      right--;
    }
  }
}
