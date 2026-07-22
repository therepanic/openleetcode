class Solution {
    public int maxCandies(int[] status, int[] candies, int[][] keys, int[][] containedBoxes, int[] initialBoxes) {
        java.util.Set<Integer> owned = new java.util.HashSet<>();
        for (int box : initialBoxes) owned.add(box);
        java.util.Set<Integer> opened = new java.util.HashSet<>();
        boolean changed = true;
        int totalCandies = 0;
        while (changed) {
            changed = false;
            Integer[] ownedArr = owned.toArray(new Integer[0]);
            for (int boxId : ownedArr) {
                if (opened.contains(boxId) || status[boxId] == 0) continue;
                opened.add(boxId);
                changed = true;
                totalCandies += candies[boxId];
                for (int keyId : keys[boxId]) {
                    status[keyId] = 1;
                }
                for (int box : containedBoxes[boxId]) {
                    owned.add(box);
                }
            }
        }
        return totalCandies;
    }
}
