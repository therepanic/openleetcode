class Solution {
  String largestTimeFromDigits(List<int> arr) {
    List<List<int>> permList = [];
    permute(arr, 0, permList);
    
    int bestTime = -1;
    int bestIdx = -1;
    
    for (int i = 0; i < permList.length; i++) {
      List<int> perm = permList[i];
      int hours = perm[0] * 10 + perm[1];
      int minutes = perm[2] * 10 + perm[3];
      
      if (hours < 24 && minutes < 60) {
        int currTime = hours * 60 + minutes;
        if (currTime > bestTime) {
          bestTime = currTime;
          bestIdx = i;
        }
      }
    }
    
    if (bestIdx == -1) return "";
    
    List<int> res = permList[bestIdx];
    return "${res[0]}${res[1]}:${res[2]}${res[3]}";
  }
  
  void permute(List<int> arr, int start, List<List<int>> result) {
    if (start == arr.length) {
      result.add(List.from(arr));
      return;
    }
    for (int i = start; i < arr.length; i++) {
      swap(arr, start, i);
      permute(arr, start + 1, result);
      swap(arr, start, i);
    }
  }
  
  void swap(List<int> arr, int i, int j) {
    int tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}
