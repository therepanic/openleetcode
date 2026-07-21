public class Solution {
    public bool IsPossible(int[] target) {
        var values = new System.Collections.Generic.List<long>();
        long total = 0;
        foreach (int value in target) { values.Add(value); total += value; }
        while (true) {
            values.Sort((a, b) => b.CompareTo(a));
            long largest = values[0], rest = total - largest;
            if (largest == 1 || rest == 1) return true;
            if (rest == 0 || rest >= largest) return false;
            long previous = largest % rest;
            if (previous == 0) return false;
            values[0] = previous;
            total = rest + previous;
        }
    }
}
