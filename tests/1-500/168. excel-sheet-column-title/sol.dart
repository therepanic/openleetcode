class Solution {
  String convertToTitle(int columnNumber) {
    final chars = <int>[];
    while (columnNumber > 0) {
      columnNumber--;
      chars.add('A'.codeUnitAt(0) + columnNumber % 26);
      columnNumber ~/= 26;
    }
    return String.fromCharCodes(chars.reversed);
  }
}
