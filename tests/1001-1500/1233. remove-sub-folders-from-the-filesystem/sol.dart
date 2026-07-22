class Solution {
  List<String> removeSubfolders(List<String> folder) {
    folder.sort();
    List<String> res = [];
    for (String f in folder) {
      if (res.isEmpty) {
        res.add(f);
      } else {
        String prev = res.last;
        if (f.startsWith(prev) && f.length > prev.length && f[prev.length] == '/') {
          continue;
        } else {
          res.add(f);
        }
      }
    }
    return res;
  }
}
