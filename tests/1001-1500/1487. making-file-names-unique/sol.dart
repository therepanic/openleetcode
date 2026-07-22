class Solution {
  List<String> getFolderNames(List<String> names) {
    Map<String, int> nameCount = {};
    List<String> result = [];

    for (String name in names) {
      if (!nameCount.containsKey(name)) {
        result.add(name);
        nameCount[name] = 1;
      } else {
        int k = nameCount[name]!;
        while (nameCount.containsKey('$name($k)')) {
          k++;
        }
        String newName = '$name($k)';
        result.add(newName);
        nameCount[name] = k + 1;
        nameCount[newName] = 1;
      }
    }

    return result;
  }
}
