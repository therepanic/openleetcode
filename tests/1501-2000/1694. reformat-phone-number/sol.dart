class Solution {
  String reformatNumber(String number) {
    String phoneCleared = number.replaceAll(RegExp(r'\D'), '');
    List<String> result = [];
    
    while (phoneCleared.length > 4) {
      result.add(phoneCleared.substring(0, 3));
      phoneCleared = phoneCleared.substring(3);
    }
    
    if (phoneCleared.length == 4) {
      result.add(phoneCleared.substring(0, 2));
      result.add(phoneCleared.substring(2));
    } else if (phoneCleared.isNotEmpty) {
      result.add(phoneCleared);
    }
    
    return result.join('-');
  }
}
