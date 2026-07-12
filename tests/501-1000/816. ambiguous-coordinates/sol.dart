class Solution {
  List<String> ambiguousCoordinates(String s) {
    s = s.substring(1, s.length - 1);
    List<String> finalResults = [];
    
    List<String> getValidNumbers(String numStr) {
      List<String> res = [];
      
      for (int i = 1; i <= numStr.length; i++) {
        String left = numStr.substring(0, i);
        String right = numStr.substring(i);
        
        if ((left.length > 1 && left.startsWith('0')) || (right.isNotEmpty && right.endsWith('0'))) {
          continue;
        }
        
        if (right.isEmpty) {
          res.add(left);
        } else {
          res.add('$left.$right');
        }
      }
      
      return res;
    }
    
    for (int i = 1; i < s.length; i++) {
      List<String> xOptions = getValidNumbers(s.substring(0, i));
      List<String> yOptions = getValidNumbers(s.substring(i));
      
      for (String x in xOptions) {
        for (String y in yOptions) {
          finalResults.add('($x, $y)');
        }
      }
    }
    
    return finalResults;
  }
}
