class Solution {
  String maximumBinaryString(String binary) {
    int n = binary.length;
    int z = binary.split('').where((c) => c == '0').length;
    
    if (z < 2) return binary;
    
    int firstZero = binary.indexOf('0');
    int p = firstZero + z - 1;
    
    return '1' * p + '0' + '1' * (n - p - 1);
  }
}
