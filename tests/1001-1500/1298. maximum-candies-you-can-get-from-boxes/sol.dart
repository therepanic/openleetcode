class Solution {
  int maxCandies(List<int> status, List<int> candies, List<List<int>> keys, List<List<int>> containedBoxes, List<int> initialBoxes) {
    var owned = initialBoxes.toSet();
    var opened = <int>{};
    var changed = true;
    var totalCandies = 0;
    while (changed) {
      changed = false;
      for (var boxId in owned.toList()) {
        if (opened.contains(boxId) || status[boxId] == 0) continue;
        opened.add(boxId);
        changed = true;
        totalCandies += candies[boxId];
        for (var keyId in keys[boxId]) {
          status[keyId] = 1;
        }
        owned.addAll(containedBoxes[boxId]);
      }
    }
    return totalCandies;
  }
}
