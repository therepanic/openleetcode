public class Solution {
    public int TotalFruit(int[] fruits) {
        int start = 0;
        int maxLen = 0;
        Dictionary<int, int> fruitCount = new Dictionary<int, int>();
        
        for (int end = 0; end < fruits.Length; end++) {
            if (fruitCount.ContainsKey(fruits[end])) {
                fruitCount[fruits[end]]++;
            } else {
                fruitCount[fruits[end]] = 1;
            }
            
            while (fruitCount.Count > 2) {
                int leftFruit = fruits[start];
                fruitCount[leftFruit]--;
                if (fruitCount[leftFruit] == 0) {
                    fruitCount.Remove(leftFruit);
                }
                start++;
            }
            
            maxLen = Math.Max(maxLen, end - start + 1);
        }
        
        return maxLen;
    }
}
