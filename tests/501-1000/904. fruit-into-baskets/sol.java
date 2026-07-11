class Solution {
    public int totalFruit(int[] fruits) {
        int start = 0;
        int maxLen = 0;
        java.util.Map<Integer, Integer> fruitCount = new java.util.HashMap<>();
        
        for (int end = 0; end < fruits.length; end++) {
            fruitCount.put(fruits[end], fruitCount.getOrDefault(fruits[end], 0) + 1);
            
            while (fruitCount.size() > 2) {
                int leftFruit = fruits[start];
                fruitCount.put(leftFruit, fruitCount.get(leftFruit) - 1);
                if (fruitCount.get(leftFruit) == 0) {
                    fruitCount.remove(leftFruit);
                }
                start++;
            }
            
            maxLen = Math.max(maxLen, end - start + 1);
        }
        
        return maxLen;
    }
}
