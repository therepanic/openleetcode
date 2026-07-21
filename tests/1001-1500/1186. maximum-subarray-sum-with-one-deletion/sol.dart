class Solution {
  int maximumSum(List<int> arr) {
    int n = arr.length;
    if (n == 1) {
      return arr[0];
    }
    
    int maxNoDelete = arr[0];
    int maxOneDelete = arr[0];
    int result = arr[0];
    
    for (int i = 1; i < n; i++) {
      int prevNoDelete = maxNoDelete;
      maxNoDelete = (maxNoDelete + arr[i] > arr[i]) ? maxNoDelete + arr[i] : arr[i];
      maxOneDelete = (maxOneDelete + arr[i] > prevNoDelete) ? maxOneDelete + arr[i] : prevNoDelete;
      int tempMax = (maxNoDelete > maxOneDelete) ? maxNoDelete : maxOneDelete;
      result = (result > tempMax) ? result : tempMax;
    }
    
    return result;
  }
}
