class Solution {
    public List<Integer> mostVisited(int n, int[] rounds) {
        int s = rounds[0], e = rounds[rounds.length - 1];
        List<Integer> ans = new ArrayList<>();
        if (s <= e) {
            for (int i = s; i <= e; i++) ans.add(i);
        } else {
            for (int i = 1; i <= e; i++) ans.add(i);
            for (int i = s; i <= n; i++) ans.add(i);
        }
        return ans;
    }
}
