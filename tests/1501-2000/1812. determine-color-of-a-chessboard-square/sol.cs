public class Solution {
    public bool SquareIsWhite(string coordinates) {
        return (coordinates[0] - coordinates[1]) % 2 != 0;
    }
}
