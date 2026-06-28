class Solution {
  List<String> removeComments(List<String> source) {
    bool inBlock = false;
    List<String> ans = [];
    StringBuffer newline = StringBuffer();
    for (String line in source) {
      int i = 0;
      if (!inBlock) {
        newline = StringBuffer();
      }
      while (i < line.length) {
        if (i + 1 < line.length && line[i] == '/' && line[i + 1] == '*' && !inBlock) {
          inBlock = true;
          i++;
        } else if (i + 1 < line.length && line[i] == '*' && line[i + 1] == '/' && inBlock) {
          inBlock = false;
          i++;
        } else if (!inBlock && i + 1 < line.length && line[i] == '/' && line[i + 1] == '/') {
          break;
        } else if (!inBlock) {
          newline.write(line[i]);
        }
        i++;
      }
      if (newline.isNotEmpty && !inBlock) {
        ans.add(newline.toString());
      }
    }
    return ans;
  }
}
