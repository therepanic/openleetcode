function Solution() {
  return {
    sampleStats(count: number[]): number[] {
      const kth = (k: number): number => {
        let acc = 0;
        for (let v = 0; v < count.length; v++) {
          acc += count[v];
          if (acc >= k) return v;
        }
        return 0;
      };

      let total = 0;
      let sum = 0;
      let minV = -1;
      let maxV = 0;
      let mode = 0;
      let modeCnt = -1;

      for (let v = 0; v < count.length; v++) {
        const c = count[v];
        if (c === 0) continue;
        if (minV === -1) minV = v;
        maxV = v;
        total += c;
        sum += v * c;
        if (c > modeCnt) {
          modeCnt = c;
          mode = v;
        }
      }

      const median =
        total % 2 === 1
          ? kth(Math.floor(total / 2) + 1)
          : (kth(total / 2) + kth(total / 2 + 1)) / 2.0;

      return [minV, maxV, sum / total, median, mode];
    },
  };
}
