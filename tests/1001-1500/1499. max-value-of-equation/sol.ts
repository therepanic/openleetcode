function findMaxValueOfEquation(points: number[][], k: number): number {
  const window: [number, number][] = [];
  let answer = -Infinity;
  for (const [x, y] of points) {
    while (window.length && x - window[0][1] > k) {
      window.shift();
    }
    if (window.length) {
      answer = Math.max(answer, x + y + window[0][0]);
    }
    const value = y - x;
    while (window.length && window[window.length - 1][0] <= value) {
      window.pop();
    }
    window.push([value, x]);
  }
  return answer;
}
