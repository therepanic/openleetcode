function isSumEqual(
  firstWord: string,
  secondWord: string,
  targetWord: string,
): boolean {
  const convert = (word: string): number => {
    return parseInt(
      word
        .split("")
        .map((ch) => ch.charCodeAt(0) - "a".charCodeAt(0))
        .join(""),
    );
  };
  return convert(firstWord) + convert(secondWord) === convert(targetWord);
}
