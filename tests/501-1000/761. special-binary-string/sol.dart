class Solution {
  String makeLargestSpecial(String s) {
    int count = 0;
    int i = 0;
    List<String> res = [];
    
    for (int j = 0; j < s.length; j++) {
      count += (s[j] == '1' ? 1 : -1);
      
      if (count == 0) {
        res.add('1' + makeLargestSpecial(s.substring(i + 1, j)) + '0');
        i = j + 1;
      }
    }
    
    res.sort((a, b) => b.compareTo(a));
    return res.join('');
  }
}
