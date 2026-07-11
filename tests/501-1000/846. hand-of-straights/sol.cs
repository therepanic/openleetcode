public class Solution {
    public bool IsNStraightHand(int[] hand, int groupSize) {
        Dictionary<int, int> hashmap = new Dictionary<int, int>();
        foreach (int h in hand) {
            if (hashmap.ContainsKey(h)) {
                hashmap[h]++;
            } else {
                hashmap[h] = 1;
            }
        }
        
        var minHeap = new SortedSet<int>(hashmap.Keys);
        
        while (minHeap.Count > 0) {
            int first = minHeap.Min;
            for (int i = first; i < first + groupSize; i++) {
                if (!hashmap.ContainsKey(i)) {
                    return false;
                }
                hashmap[i]--;
                if (hashmap[i] == 0) {
                    if (i != minHeap.Min) {
                        return false;
                    }
                    minHeap.Remove(i);
                }
            }
        }
        return true;
    }
}
