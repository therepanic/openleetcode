class Solution {
  List<int> addNegabinary(List<int> arr1, List<int> arr2) {
    List<int> res = [];
    int i = arr1.length - 1, j = arr2.length - 1;
    int carry = 0;
    
    while (carry != 0 || i >= 0 || j >= 0) {
      if (i >= 0) carry += arr1[i--];
      if (j >= 0) carry += arr2[j--];
      res.add(carry & 1);
      carry = -(carry >> 1);
    }
    
    while (res.length > 1 && res.last == 0) {
      res.removeLast();
    }
    
    return res.reversed.toList();
  }
}
