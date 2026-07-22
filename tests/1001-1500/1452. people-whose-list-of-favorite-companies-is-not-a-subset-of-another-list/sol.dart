class Solution {
  List<int> peopleIndexes(List<List<String>> favoriteCompanies) {
    List<Set<String>> sets = favoriteCompanies.map((companies) => companies.toSet()).toList();
    List<int> result = [];
    
    for (int i = 0; i < sets.length; i++) {
      bool isSubset = false;
      for (int j = 0; j < sets.length; j++) {
        if (i != j && sets[j].containsAll(sets[i])) {
          isSubset = true;
          break;
        }
      }
      if (!isSubset) {
        result.add(i);
      }
    }
    
    return result;
  }
}
