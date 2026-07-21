import java.util.*;

class Solution {
    public List<Integer> peopleIndexes(String[][] favoriteCompanies) {
        List<Set<String>> sets = new ArrayList<>();
        for (String[] companies : favoriteCompanies) {
            sets.add(new HashSet<>(Arrays.asList(companies)));
        }
        
        List<Integer> result = new ArrayList<>();
        int n = sets.size();
        
        for (int i = 0; i < n; i++) {
            boolean isSubset = false;
            for (int j = 0; j < n; j++) {
                if (i != j && sets.get(j).containsAll(sets.get(i))) {
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
