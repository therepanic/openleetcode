function countOfAtoms(formula: string): string {
  const result = decodeAtomsHelper(0, formula);
  const atomsFreq = result[0];

  const sortedKeys = Array.from(atomsFreq.keys()).sort();
  let decodedFormula = "";

  for (const key of sortedKeys) {
    decodedFormula += key;
    if (atomsFreq.get(key)! > 1) {
      decodedFormula += atomsFreq.get(key)!;
    }
  }

  return decodedFormula;
}

function decodeAtomsHelper(
  i: number,
  s: string,
): [Map<string, number>, number] {
  const size = s.length;
  const decoded = new Map<string, number>();

  while (i < size) {
    let atom = "";
    let power = 0;

    if (s[i] >= "A" && s[i] <= "Z") {
      atom += s[i];
      i++;

      while (i < size && s[i] >= "a" && s[i] <= "z") {
        atom += s[i];
        i++;
      }
    }

    while (i < size && s[i] >= "0" && s[i] <= "9") {
      power = power * 10 + parseInt(s[i]);
      i++;
    }

    if (atom.length !== 0) {
      if (power === 0) {
        decoded.set(atom, (decoded.get(atom) || 0) + 1);
      } else {
        decoded.set(atom, (decoded.get(atom) || 0) + power);
      }
    }

    power = 0;
    atom = "";

    if (i < size && s[i] === "(") {
      i++;
      const smallerResult = decodeAtomsHelper(i, s);
      const smallerDecoded = smallerResult[0];
      i = smallerResult[1];

      power = 0;
      while (i < size && s[i] >= "0" && s[i] <= "9") {
        power = power * 10 + parseInt(s[i]);
        i++;
      }

      if (power === 0) {
        power = 1;
      }

      for (const [key, value] of smallerDecoded) {
        decoded.set(key, (decoded.get(key) || 0) + value * power);
      }
    }

    if (i < size && s[i] === ")") {
      i++;
      return [decoded, i];
    }
  }

  return [decoded, i];
}
