class Solution {
  bool isPalindrome(String s) {
    var left = 0;
    var right = s.length - 1;
    while (left < right) {
      while (left < right && !_isAlphaNumeric(s.codeUnitAt(left))) left++;
      while (left < right && !_isAlphaNumeric(s.codeUnitAt(right))) right--;
      if (_toLower(s.codeUnitAt(left)) != _toLower(s.codeUnitAt(right))) return false;
      left++;
      right--;
    }
    return true;
  }

  bool _isAlphaNumeric(int code) => (code >= 48 && code <= 57) || (code >= 65 && code <= 90) || (code >= 97 && code <= 122);
  int _toLower(int code) => (code >= 65 && code <= 90) ? code + 32 : code;
}
