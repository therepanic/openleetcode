class Solution {
  String destCity(List<List<String>> paths) {
    Set<String> startCities = {};
    
    for (var path in paths) {
      startCities.add(path[0]);
    }
    
    for (var path in paths) {
      if (!startCities.contains(path[1])) {
        return path[1];
      }
    }
    
    return "";
  }
}
