class Solution {
  String solveEquation(String equation) {
    var parts = equation.split("=");
    var left = _parseSide(parts[0]);
    var right = _parseSide(parts[1]);
    
    int coeff = left[0] - right[0];
    int constant = right[1] - left[1];
    
    if (coeff == 0) {
      return constant != 0 ? "No solution" : "Infinite solutions";
    }
    return "x=${constant ~/ coeff}";
  }
  
  List<int> _parseSide(String side) {
    int coeff = 0;
    int constant = 0;
    String num = "";
    int sign = 1;
    side += "+";
    
    for (var ch in side.split('')) {
      if (ch == '+' || ch == '-') {
        if (num.isNotEmpty) {
          constant += sign * int.parse(num);
          num = "";
        }
        sign = ch == '+' ? 1 : -1;
      } else if (RegExp(r'\d').hasMatch(ch)) {
        num += ch;
      } else if (ch == 'x') {
        coeff += sign * (num.isNotEmpty ? int.parse(num) : 1);
        num = "";
      }
    }
    return [coeff, constant];
  }
}
