class Solution {
  List<List<String>> accountsMerge(List<List<String>> accounts) {
    int n = accounts.length;
    Map<String, Set<int>> location = {};
    List<Set<String>> content = [];
    
    for (int i = 0; i < n; i++) {
      String name = accounts[i][0];
      location.putIfAbsent(name, () => <int>{});
      location[name]!.add(i);
      content.add(Set<String>.from(accounts[i].skip(1)));
    }
    
    for (var entry in Map<String, Set<int>>.from(location).entries) {
      String name = entry.key;
      Set<int> indices = entry.value;
      for (int i in Set<int>.from(indices)) {
        for (int j in Set<int>.from(indices)) {
          if (i != j && content[i].intersection(content[j]).isNotEmpty) {
            content[j].addAll(content[i]);
            indices.remove(i);
            break;
          }
        }
      }
    }
    
    List<List<String>> result = [];
    for (var entry in location.entries) {
      String name = entry.key;
      for (int idx in entry.value) {
        List<String> sortedEmails = content[idx].toList()..sort();
        result.add([name, ...sortedEmails]);
      }
    }
    return result;
  }
}
