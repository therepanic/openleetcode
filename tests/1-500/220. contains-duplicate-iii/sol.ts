function containsNearbyAlmostDuplicate(
  nums: number[],
  indexDiff: number,
  valueDiff: number,
): boolean {
  if (indexDiff <= 0 || valueDiff < 0) {
    return false;
  }

  const width = valueDiff + 1;
  const buckets = new Map<number, number>();

  for (let i = 0; i < nums.length; i++) {
    const x = nums[i];
    const bid = Math.floor(x / width);

    if (buckets.has(bid)) {
      return true;
    }

    const left = buckets.get(bid - 1);
    if (left !== undefined && Math.abs(x - left) <= valueDiff) {
      return true;
    }
    const right = buckets.get(bid + 1);
    if (right !== undefined && Math.abs(x - right) <= valueDiff) {
      return true;
    }

    buckets.set(bid, x);

    if (i >= indexDiff) {
      const old = nums[i - indexDiff];
      const oldBid = Math.floor(old / width);
      buckets.delete(oldBid);
    }
  }

  return false;
}
