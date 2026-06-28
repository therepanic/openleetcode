class Solution {
  String complexNumberMultiply(String num1, String num2) {
    List<int> parseComplex(String s) {
      List<String> parts = s.split('+');
      int real = int.parse(parts[0]);
      int imag = int.parse(parts[1].substring(0, parts[1].length - 1));
      return [real, imag];
    }
    
    List<int> first = parseComplex(num1);
    List<int> second = parseComplex(num2);
    int a = first[0], b = first[1];
    int c = second[0], d = second[1];
    int realPart = a * c - b * d;
    int imagPart = a * d + b * c;
    return '$realPart+${imagPart}i';
  }
}
