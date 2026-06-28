class Solution {
  int numJewelsInStones(String jewels, String stones) {
    int count = 0;
    for (var i in jewels.split('')) {
      if (stones.contains(i)) {
        count += i.allMatches(stones).length;
      }
    }
    return count;
  }
}
