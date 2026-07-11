class Solution {
    public int subarrayBitwiseORs(int[] arr) {
        Set<Integer> resultOrs = new HashSet<>();
        Set<Integer> currentOrs = new HashSet<>();
        
        for (int x : arr) {
            Set<Integer> nextOrs = new HashSet<>();
            for (int y : currentOrs) {
                nextOrs.add(x | y);
            }
            nextOrs.add(x);
            resultOrs.addAll(nextOrs);
            currentOrs = nextOrs;
        }
        
        return resultOrs.size();
    }
}
