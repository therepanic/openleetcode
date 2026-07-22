public class Solution {
    public IList<int> NumOfBurgers(int tomatoSlices, int cheeseSlices) {
        if ((tomatoSlices - 2 * cheeseSlices) % 2 != 0) {
            return new List<int>();
        }

        int x = (tomatoSlices - 2 * cheeseSlices) / 2;
        int y = cheeseSlices - x;

        if (x < 0 || y < 0) {
            return new List<int>();
        }

        return new List<int> { x, y };
    }
}
