public class Solution {
    public IList<int> PeopleIndexes(IList<IList<string>> favoriteCompanies) {
        var sets = new List<HashSet<string>>();
        foreach (var companies in favoriteCompanies) {
            sets.Add(new HashSet<string>(companies));
        }
        
        var result = new List<int>();
        int n = sets.Count;
        
        for (int i = 0; i < n; i++) {
            bool isSubset = false;
            for (int j = 0; j < n; j++) {
                if (i != j && sets[i].IsSubsetOf(sets[j])) {
                    isSubset = true;
                    break;
                }
            }
            if (!isSubset) {
                result.Add(i);
            }
        }
        
        return result;
    }
}
