class Solution {
  int maxDiff(int num) {
    String numStr = num.toString();
    var uniqueDigits = numStr.split('').toSet();
    int maxVal = num;
    int minVal = num;
    
    for (var digit in uniqueDigits) {
      for (var newDigitCode = 48; newDigitCode <= 57; newDigitCode++) {
        String newDigit = String.fromCharCode(newDigitCode);
        if (numStr[0] == digit && newDigit == '0') {
          continue;
        }
        String newNumStr = numStr.replaceAll(digit, newDigit);
        int newNum = int.parse(newNumStr);
        if (newNum > maxVal) maxVal = newNum;
        if (newNum < minVal) minVal = newNum;
      }
    }
    
    return maxVal - minVal;
  }
}
