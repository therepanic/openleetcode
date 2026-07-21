class Solution {
    public List<List<Integer>> groupThePeople(int[] groupSizes) {
        List<List<Integer>> ans = new ArrayList<>();
        Map<Integer, List<Integer>> mp = new HashMap<>();
        for (int i = 0; i < groupSizes.length; i++) {
            int val = groupSizes[i];
            mp.computeIfAbsent(val, k -> new ArrayList<>()).add(i);
            if (mp.get(val).size() == val) {
                ans.add(mp.get(val));
                mp.put(val, new ArrayList<>());
            }
        }
        return ans;
    }
}
