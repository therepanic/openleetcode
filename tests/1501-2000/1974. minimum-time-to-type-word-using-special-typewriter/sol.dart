class Solution {
  int minTimeToType(String word) {
    int answer = 0;
    int pointer = 'a'.codeUnitAt(0);
    
    for (int i = 0; i < word.length; i++) {
      int current = word.codeUnitAt(i);
      int clockwise = (current - pointer).abs();
      int counterclockwise = 26 - clockwise;
      answer += (clockwise < counterclockwise ? clockwise : counterclockwise) + 1;
      pointer = current;
    }
    
    return answer;
  }
}
