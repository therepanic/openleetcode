class Solution {
  bool isValid(String code) {
    final tagPat = RegExp(r'^<(/?)([A-Z]{1,9})>$');
    const openCdata = "<![CDATA[";
    const closeCdata = "]]>";
    List<String> stack = [];
    bool firstTagSeen = false;
    int i = 0;
    int j = code.length;
    
    while (i <= j) {
      int s = code.indexOf('<', i);
      if (s == -1) break;
      int e = code.indexOf('>', s + 1);
      if (e == -1) return false;
      
      String candidate = code.substring(s, e + 1);
      Match? m = tagPat.firstMatch(candidate);
      
      if (m != null) {
        String tag = m.group(2)!;
        
        if (m.group(1)!.isEmpty) {
          if (!firstTagSeen && s != 0) return false;
          stack.add(tag);
          firstTagSeen = true;
        } else {
          if (stack.isEmpty || stack.last != tag) return false;
          if (stack.length == 1 && e != code.length - 1) return false;
          stack.removeLast();
        }
        
        i = e + 1;
      } else if (code.startsWith(openCdata, s)) {
        int k = code.indexOf(closeCdata, s + openCdata.length);
        if (k == -1) return false;
        i = k + closeCdata.length;
      } else {
        return false;
      }
    }
    
    return stack.isEmpty && firstTagSeen;
  }
}
