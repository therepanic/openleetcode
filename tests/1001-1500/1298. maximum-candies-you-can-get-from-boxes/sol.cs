public class Solution {
    public int MaxCandies(int[] status, int[] candies, int[][] keys, int[][] containedBoxes, int[] initialBoxes) {
        var owned = new HashSet<int>(initialBoxes);
        var opened = new HashSet<int>();
        bool changed = true;
        int totalCandies = 0;
        while (changed) {
            changed = false;
            var ownedList = new List<int>(owned);
            foreach (int boxId in ownedList) {
                if (opened.Contains(boxId) || status[boxId] == 0) continue;
                opened.Add(boxId);
                changed = true;
                totalCandies += candies[boxId];
                foreach (int keyId in keys[boxId]) {
                    status[keyId] = 1;
                }
                foreach (int box in containedBoxes[boxId]) {
                    owned.Add(box);
                }
            }
        }
        return totalCandies;
    }
}
