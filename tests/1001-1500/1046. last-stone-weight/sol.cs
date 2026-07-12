public class Solution {
    public int LastStoneWeight(int[] stones) {
        var list = new System.Collections.Generic.List<int>(stones);
        while (list.Count > 1) {
            list.Sort((a, b) => b.CompareTo(a));
            int maxStone1 = list[0];
            int maxStone2 = list[1];
            list.RemoveAt(0);
            list.RemoveAt(0);
            if (maxStone1 != maxStone2) {
                list.Add(maxStone1 - maxStone2);
            }
        }
        return list.Count == 0 ? 0 : list[0];
    }
}
