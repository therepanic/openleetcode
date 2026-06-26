class Solution {
  int nextGreaterElement(int n) {
    List<String> digits = n.toString().split('');
    int length = digits.length;
    int pivot = -1;

    for (int i = length - 2; i >= 0; i--) {
      if (digits[i].compareTo(digits[i + 1]) < 0) {
        pivot = i;
        break;
      }
    }

    if (pivot == -1) {
      return -1;
    }

    for (int i = length - 1; i > pivot; i--) {
      if (digits[i].compareTo(digits[pivot]) > 0) {
        String temp = digits[i];
        digits[i] = digits[pivot];
        digits[pivot] = temp;
        break;
      }
    }

    int left = pivot + 1;
    int right = length - 1;
    while (left < right) {
      String temp = digits[left];
      digits[left] = digits[right];
      digits[right] = temp;
      left++;
      right--;
    }

    int result = int.parse(digits.join(''));
    return result <= 2147483647 ? result : -1;
  }
}
