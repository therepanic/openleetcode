function slowestKey(releaseTimes: number[], keysPressed: string): string {
  let maxTime = releaseTimes[0];
  let ans = keysPressed[0];
  for (let i = 1; i < releaseTimes.length; i++) {
    const currTime = releaseTimes[i] - releaseTimes[i - 1];
    if (currTime > maxTime) {
      maxTime = currTime;
      ans = keysPressed[i];
    } else if (currTime === maxTime) {
      if (keysPressed[i] > ans) {
        ans = keysPressed[i];
      }
    }
  }
  return ans;
}
