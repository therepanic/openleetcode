function carFleet(target: number, position: number[], speed: number[]): number {
  const cars: [number, number][] = [];
  for (let i = 0; i < position.length; i++) {
    cars.push([position[i], speed[i]]);
  }
  cars.sort((a, b) => b[0] - a[0]);
  const stack: number[] = [];
  for (const [p, s] of cars) {
    const t = (target - p) / s;
    if (stack.length === 0 || t > stack[stack.length - 1]) {
      stack.push(t);
    }
  }
  return stack.length;
}
