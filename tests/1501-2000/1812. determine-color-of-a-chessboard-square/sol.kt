class Solution {
    fun squareIsWhite(coordinates: String): Boolean {
        return ((coordinates[0] - coordinates[1]) % 2) != 0
    }
}
