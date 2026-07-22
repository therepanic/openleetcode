class Solution {
  List<int> numOfBurgers(int tomatoSlices, int cheeseSlices) {
    if ((tomatoSlices - 2 * cheeseSlices) % 2 != 0) {
      return [];
    }

    int x = (tomatoSlices - 2 * cheeseSlices) ~/ 2;
    int y = cheeseSlices - x;

    if (x < 0 || y < 0) {
      return [];
    }

    return [x, y];
  }
}
