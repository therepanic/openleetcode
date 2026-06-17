class Solution {
  List<int> diffWaysToCompute(String expression) {
    if (RegExp(r'^\d+$').hasMatch(expression)) {
      return [int.parse(expression)];
    }
    
    List<int> results = [];
    
    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];
      if (char == '+' || char == '-' || char == '*') {
        List<int> leftResults = diffWaysToCompute(expression.substring(0, i));
        List<int> rightResults = diffWaysToCompute(expression.substring(i + 1));
        
        for (int left in leftResults) {
          for (int right in rightResults) {
            if (char == '+') {
              results.add(left + right);
            } else if (char == '-') {
              results.add(left - right);
            } else if (char == '*') {
              results.add(left * right);
            }
          }
        }
      }
    }
    
    return results;
  }
}
