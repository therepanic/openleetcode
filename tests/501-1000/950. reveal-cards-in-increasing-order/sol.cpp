class Solution {
public:
    vector<int> deckRevealedIncreasing(vector<int>& deck) {
        sort(deck.begin(), deck.end());
        deque<int> rebuild;
        rebuild.push_back(deck.back());
        for (int i = deck.size() - 2; i >= 0; i--) {
            int last = rebuild.back();
            rebuild.pop_back();
            rebuild.push_front(last);
            rebuild.push_front(deck[i]);
        }
        return vector<int>(rebuild.begin(), rebuild.end());
    }
};
