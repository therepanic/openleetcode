class Solution {
  int maxProduct(String s) {
    int n = s.length;
    
    // Manacher (odd length only)
    List<int> d = List.filled(n, 0);
    int l = 0;
    int r = -1;
    
    for (int i = 0; i < n; i++) {
      int k;
      if (i > r) {
        k = 1;
      } else {
        k = d[l + r - i] < r - i + 1 ? d[l + r - i] : r - i + 1;
      }
      
      while (i - k >= 0 && i + k < n && s[i - k] == s[i + k]) {
        k++;
      }
      
      d[i] = k;
      
      if (i + k - 1 > r) {
        l = i - k + 1;
        r = i + k - 1;
      }
    }
    
    // left[i] = max palindrome ending at i
    List<int> left = List.filled(n, 0);
    
    for (int i = 0; i < n; i++) {
      int radius = d[i];
      int length = 2 * radius - 1;
      int end = i + radius - 1;
      left[end] = left[end] > length ? left[end] : length;
    }
    
    // propagate backwards (reduce by 2)
    for (int i = n - 2; i >= 0; i--) {
      int val = left[i + 1] - 2;
      left[i] = left[i] > val ? left[i] : val;
    }
    
    // prefix max
    for (int i = 1; i < n; i++) {
      left[i] = left[i] > left[i - 1] ? left[i] : left[i - 1];
    }
    
    
    // right[i] = max palindrome starting at i
    List<int> right = List.filled(n, 0);
    
    for (int i = 0; i < n; i++) {
      int radius = d[i];
      int length = 2 * radius - 1;
      int start = i - radius + 1;
      right[start] = right[start] > length ? right[start] : length;
    }
    
    // propagate forward (reduce by 2)
    for (int i = 1; i < n; i++) {
      int val = right[i - 1] - 2;
      right[i] = right[i] > val ? right[i] : val;
    }
    
    // suffix max
    for (int i = n - 2; i >= 0; i--) {
      right[i] = right[i] > right[i + 1] ? right[i] : right[i + 1];
    }
    
    
    // try all splits
    int ans = 0;
    for (int i = 0; i < n - 1; i++) {
      int prod = left[i] * right[i + 1];
      ans = ans > prod ? ans : prod;
    }
    
    return ans;
  }
}
