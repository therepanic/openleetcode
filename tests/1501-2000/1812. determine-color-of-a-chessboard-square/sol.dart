class Solution {
  bool squareIsWhite(String coordinates) {
    return (coordinates.codeUnitAt(0) - coordinates.codeUnitAt(1)) % 2 != 0;
  }
}
