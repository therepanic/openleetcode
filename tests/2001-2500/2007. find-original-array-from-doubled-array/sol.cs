public class Solution {
    public int[] FindOriginalArray(int[] changed) {
        if (changed.Length % 2 != 0) return new int[0];
        
        var count = new Dictionary<int, int>();
        foreach (int num in changed) {
            count[num] = count.GetValueOrDefault(num) + 1;
        }
        Array.Sort(changed);
        var original = new List<int>();
        
        foreach (int num in changed) {
            if (count[num] == 0) continue;
            if (count.GetValueOrDefault(2 * num) == 0) return new int[0];
            original.Add(num);
            count[num]--;
            count[2 * num]--;
        }
        
        return original.ToArray();
    }
}
