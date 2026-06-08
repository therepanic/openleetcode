class Solution {
  String intToRoman(int num) {
    const M = ['', 'M', 'MM', 'MMM'];
    const C = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'];
    const X = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'];
    const I = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'];
    return M[num ~/ 1000] + C[(num % 1000) ~/ 100] + X[(num % 100) ~/ 10] + I[num % 10];
  }
}
