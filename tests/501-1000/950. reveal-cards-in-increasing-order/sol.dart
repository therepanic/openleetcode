class Solution {
  List<int> deckRevealedIncreasing(List<int> deck) {
    deck.sort();
    List<int> rebuild = [deck.last];
    for (int i = deck.length - 2; i >= 0; i--) {
      rebuild.insert(0, rebuild.removeLast());
      rebuild.insert(0, deck[i]);
    }
    return rebuild;
  }
}
