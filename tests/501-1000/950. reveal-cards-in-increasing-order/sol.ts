function deckRevealedIncreasing(deck: number[]): number[] {
  deck.sort((a, b) => a - b);
  const rebuild: number[] = [deck[deck.length - 1]];
  for (let i = deck.length - 2; i >= 0; i--) {
    rebuild.unshift(rebuild.pop()!);
    rebuild.unshift(deck[i]);
  }
  return rebuild;
}
