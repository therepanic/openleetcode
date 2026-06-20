class Solution {
  int largestPalindrome(int n) {
    if (n == 1) {
      return 9;
    }
    
    int minNum = pow(10, n - 1).toInt();
    int maxNum = pow(10, n).toInt() - 1;
    int maxPal = 0;
    
    for (int i = maxNum; i >= minNum; i -= 2) {
      if (i * i < maxPal) {
        break;
      }
      
      for (int j = maxNum; j >= i; j -= 2) {
        int product = i * j;
        
        if (product % 11 != 0 && product >= maxPal) {
          continue;
        }
        
        String str = product.toString();
        if (str == str.split('').reversed.join('')) {
          maxPal = product;
        }
      }
    }
    
    return maxPal % 1337;
  }
}

int pow(int base, int exp) {
  int result = 1;
  for (int i = 0; i < exp; i++) {
    result *= base;
  }
  return result;
}
