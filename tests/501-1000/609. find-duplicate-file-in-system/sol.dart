class Solution {
  List<List<String>> findDuplicate(List<String> paths) {
    Map<String, List<String>> map = {};
    for (String path in paths) {
      List<String> parts = path.split(" ");
      String directory = parts[0];
      for (int i = 1; i < parts.length; i++) {
        String file = parts[i];
        int parenIndex = file.indexOf('(');
        String name = file.substring(0, parenIndex);
        String content = file.substring(parenIndex + 1, file.length - 1);
        String fullPath = "$directory/$name";
        map.putIfAbsent(content, () => []).add(fullPath);
      }
    }
    return map.values.where((group) => group.length > 1).toList();
  }
}
