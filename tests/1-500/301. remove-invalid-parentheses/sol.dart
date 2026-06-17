class Solution {
  List<String> removeInvalidParentheses(String s) {
    bool isValid(String str) {
      int ctr = 0;
      for (int i = 0; i < str.length; i++) {
        if (str[i] == '(') {
          ctr++;
        } else if (str[i] == ')') {
          if (ctr == 0) return false;
          ctr--;
        }
      }
      return ctr == 0;
    }
    
    var level = <String>{s};
    while (true) {
      var valid = level.where((str) => isValid(str)).toList();
      if (valid.isNotEmpty) return valid;
      var nextLevel = <String>{};
      for (var str in level) {
        for (int i = 0; i < str.length; i++) {
          nextLevel.add(str.substring(0, i) + str.substring(i + 1));
        }
      }
      level = nextLevel;
    }
  }
}
