function Solution() {
  return {
    carPooling(trips: number[][], capacity: number): boolean {
      const diff = new Array(1001).fill(0);
      for (const trip of trips) {
        diff[trip[1]] += trip[0];
        diff[trip[2]] -= trip[0];
      }
      let curr = 0;
      for (const delta of diff) {
        curr += delta;
        if (curr > capacity) {
          return false;
        }
      }
      return true;
    },
  };
}
