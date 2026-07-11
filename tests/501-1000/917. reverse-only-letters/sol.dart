class Solution {
  String reverseOnlyLetters(String s) {
    List<String> chars = s.split('');
    int start = 0;
    int end = chars.length - 1;
    while (true) {
      if (start >= end) {
        break;
      }
      
      bool startIsLetter = RegExp(r'[a-zA-Z]').hasMatch(chars[start]);
      bool endIsLetter = RegExp(r'[a-zA-Z]').hasMatch(chars[end]);
      
      if (startIsLetter && endIsLetter) {
        String temp = chars[start];
        chars[start] = chars[end];
        chars[end] = temp;
        start++;
        end--;
      } else if (!startIsLetter) {
        start++;
      } else {
        end--;
      }
    }
    
    return chars.join('');
  }
}
