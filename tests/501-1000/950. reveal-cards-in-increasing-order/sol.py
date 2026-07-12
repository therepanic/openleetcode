from collections import deque


class Solution(object):
    def deckRevealedIncreasing(self, deck):
        # Step 1: Sort the deck to know the target reveal order
        deck.sort()

        # Step 2: Initialize a deque with the largest card (the last one revealed)
        rebuild = deque([deck[-1]])

        # Step 3: Iterate through the remaining cards from largest to smallest
        # we skip the last one since it's already in the deque
        for card in reversed(deck[:-1]):
            # Reverse Rule: Take what was at the "bottom" and move it to the "top"
            rebuild.appendleft(rebuild.pop())

            # Undo the reveal: Put the current card on top of the pile
            rebuild.appendleft(card)

        # Convert the deque back to a list for the final answer
        return list(rebuild)
