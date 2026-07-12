import 'dart:collection';

class Solution {
  int kSimilarity(String s1, String s2) {
    var queue = Queue<String>();
    queue.add(s1);
    var seen = <String>{};
    int answ = 0;
    
    while (queue.isNotEmpty) {
      int size = queue.length;
      for (int k = 0; k < size; k++) {
        String string = queue.removeFirst();
        if (string == s2) return answ;
        
        int i = 0;
        while (string[i] == s2[i]) i++;
        
        for (int j = i + 1; j < string.length; j++) {
          if (string[i] == s2[j] && s2[j] != s1[j]) {
            String newStr = string.substring(0, i) + string[j] +
                           string.substring(i + 1, j) + string[i] +
                           string.substring(j + 1);
            if (!seen.contains(newStr)) {
              seen.add(newStr);
              queue.add(newStr);
            }
          }
        }
      }
      answ++;
    }
    return answ;
  }
}
