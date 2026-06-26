class Solution {
    public int maxDistance(List<List<Integer>> arrays) {
        int smallest = arrays.get(0).get(0);
        int largest = arrays.get(0).get(arrays.get(0).size() - 1);
        int ans = 0;
        for (int i = 1; i < arrays.size(); i++) {
            int curMin = arrays.get(i).get(0);
            int curMax = arrays.get(i).get(arrays.get(i).size() - 1);
            ans = Math.max(ans, Math.max(largest - curMin, curMax - smallest));
            smallest = Math.min(curMin, smallest);
            largest = Math.max(curMax, largest);
        }
        return ans;
    }
}
