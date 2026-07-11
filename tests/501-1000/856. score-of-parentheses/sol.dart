class Solution {
  int scoreOfParentheses(String s) {
    List<int> scoreStack = [0];
    
    for (var parentheses in s.split('')) {
      if (parentheses == '(') {
        scoreStack.add(0);
      } else if (scoreStack.isNotEmpty) {
        int lastScore = scoreStack.removeLast();
        scoreStack.last += max(lastScore * 2, 1);
      }
    }
    
    return scoreStack.last;
  }
  
  int max(int a, int b) => a > b ? a : b;
}
