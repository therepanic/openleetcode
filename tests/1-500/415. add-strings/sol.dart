class Solution {
  String addStrings(String num1, String num2) {
    List<String> result = [];
    int carry = 0;
    int i = num1.length - 1, j = num2.length - 1;
    
    while (i >= 0 || j >= 0 || carry > 0) {
      int digit1 = i >= 0 ? num1.codeUnitAt(i) - '0'.codeUnitAt(0) : 0;
      int digit2 = j >= 0 ? num2.codeUnitAt(j) - '0'.codeUnitAt(0) : 0;
      
      int total = digit1 + digit2 + carry;
      carry = total ~/ 10;
      result.add(String.fromCharCode(total % 10 + '0'.codeUnitAt(0)));
      
      i--;
      j--;
    }
    
    return result.reversed.join();
  }
}
