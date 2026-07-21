class Solution {
    public List<Boolean> kidsWithCandies(int[] candies, int extraCandies) {
        int currentMax = 0;
        for (int candy : candies) {
            if (candy > currentMax) {
                currentMax = candy;
            }
        }
        List<Boolean> result = new ArrayList<>();
        for (int candyCount : candies) {
            if (candyCount + extraCandies >= currentMax) {
                result.add(true);
            } else {
                result.add(false);
            }
        }
        return result;
    }
}
