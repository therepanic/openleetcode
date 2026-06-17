class Solution {
  bool isValidSerialization(String preorder) {
    int slots = 1;
    for (String node in preorder.split(',')) {
      slots--;
      if (slots < 0) return false;
      if (node != '#') slots += 2;
    }
    return slots == 0;
  }
}
