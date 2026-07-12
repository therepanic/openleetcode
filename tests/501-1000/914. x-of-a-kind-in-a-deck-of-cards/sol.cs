public class Solution {
    public bool HasGroupsSizeX(int[] deck) {
        Dictionary<int, int> counts = new Dictionary<int, int>();
        foreach (int card in deck) {
            if (counts.ContainsKey(card)) {
                counts[card]++;
            } else {
                counts[card] = 1;
            }
        }
        
        int GetGcd(int a, int b) {
            while (b > 0) {
                int temp = b;
                b = a % b;
                a = temp;
            }
            return a;
        }
        
        List<int> frequencies = new List<int>(counts.Values);
        int currentGcd = frequencies[0];
        
        for (int i = 1; i < frequencies.Count; i++) {
            currentGcd = GetGcd(currentGcd, frequencies[i]);
            if (currentGcd == 1) {
                return false;
            }
        }
        
        return currentGcd >= 2;
    }
}
