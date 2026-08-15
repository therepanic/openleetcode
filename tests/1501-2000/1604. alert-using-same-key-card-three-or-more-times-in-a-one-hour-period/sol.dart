class Solution {
  List<String> alertNames(List<String> keyName, List<String> keyTime) {
    Map<String, List<int>> map = {};
    
    for (int i = 0; i < keyName.length; i++) {
      List<String> parts = keyTime[i].split(':');
      int minutes = int.parse(parts[0]) * 60 + int.parse(parts[1]);
      map.putIfAbsent(keyName[i], () => []).add(minutes);
    }
    
    List<String> result = [];
    
    map.forEach((name, times) {
      times.sort();
      for (int i = 0; i < times.length - 2; i++) {
        if (times[i+2] - times[i] <= 60) {
          result.add(name);
          return;
        }
      }
    });
    
    result.sort();
    return result;
  }
}
