function minTimeToType(word: string): number {
  let answer = 0;
  let pointer = "a".charCodeAt(0);

  for (let i = 0; i < word.length; i++) {
    let current = word.charCodeAt(i);
    let clockwise = Math.abs(current - pointer);
    let counterclockwise = 26 - clockwise;
    answer += Math.min(clockwise, counterclockwise) + 1;
    pointer = current;
  }

  return answer;
}
