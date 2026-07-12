public class Solution {
    public int[] DeckRevealedIncreasing(int[] deck) {
        Array.Sort(deck);
        var rebuild = new LinkedList<int>();
        rebuild.AddLast(deck[deck.Length - 1]);
        for (int i = deck.Length - 2; i >= 0; i--) {
            int last = rebuild.Last.Value;
            rebuild.RemoveLast();
            rebuild.AddFirst(last);
            rebuild.AddFirst(deck[i]);
        }
        return rebuild.ToArray();
    }
}
