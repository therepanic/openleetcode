function decode(encoded: number[]): number[] {
  const n = encoded.length + 1;
  let xr = 0;
  for (let i = 1; i <= n; i++) xr ^= i;
  let nxr = 0;
  for (let i = 0; i < encoded.length; i++) {
    if (i % 2 === 1) nxr ^= encoded[i];
  }
  const perm = new Array(n);
  perm[0] = xr ^ nxr;
  for (let i = 0; i < encoded.length; i++) {
    perm[i + 1] = encoded[i] ^ perm[i];
  }
  return perm;
}
