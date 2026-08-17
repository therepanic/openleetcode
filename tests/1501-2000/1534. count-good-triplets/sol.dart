class Solution {
  int countGoodTriplets(List<int> arr, int a, int b, int c) {
    var answer = 0;
    for (var i = 0; i < arr.length; i++) {
      for (var j = i + 1; j < arr.length; j++) {
        if ((arr[i] - arr[j]).abs() > a) continue;
        for (var k = j + 1; k < arr.length; k++) {
          if ((arr[j] - arr[k]).abs() <= b && (arr[i] - arr[k]).abs() <= c) answer++;
        }
      }
    }
    return answer;
  }
}
