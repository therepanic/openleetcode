public class Solution {
    public int SubarrayBitwiseORs(int[] arr) {
        HashSet<int> resultOrs = new HashSet<int>();
        HashSet<int> currentOrs = new HashSet<int>();
        
        foreach (int x in arr) {
            HashSet<int> nextOrs = new HashSet<int>();
            foreach (int y in currentOrs) {
                nextOrs.Add(x | y);
            }
            nextOrs.Add(x);
            resultOrs.UnionWith(nextOrs);
            currentOrs = nextOrs;
        }
        
        return resultOrs.Count;
    }
}
