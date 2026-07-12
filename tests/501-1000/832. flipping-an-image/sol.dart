class Solution {
  List<List<int>> flipAndInvertImage(List<List<int>> image) {
    for (var row in image) {
      int left = 0, right = row.length - 1;
      while (left <= right) {
        int temp = 1 - row[right];
        row[right] = 1 - row[left];
        row[left] = temp;
        left++;
        right--;
      }
    }
    return image;
  }
}
