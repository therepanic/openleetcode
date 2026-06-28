class Solution:
    # test H20O testcase
    def countOfAtoms(self, formula: str) -> str:
        atoms_freq: dict[str, int] = dict()
        i: int = 0
        atoms_freq, i = self.decode_atoms_helper(i, formula)

        sorted_atom_freq: dict[str, int] = dict(
            sorted(atoms_freq.items(), key=lambda x: x[0])
        )

        decoded_formula: str = ""
        for key, value in sorted_atom_freq.items():
            if value == 1:
                decoded_formula += key
            else:
                decoded_formula += key + str(value)

        return decoded_formula

    def decode_atoms_helper(self, i: int, s: str) -> tuple[dict[str, int], int]:
        size: int = len(s)

        decoded: dict[str, int] = dict()

        while i < size:
            atom: str = ""
            power: int = 0

            # check captial start point of atom
            if s[i] >= "A" and s[i] <= "Z":
                atom += s[i]
                i += 1

                # if lower atoms suffix is present [Optional]
                while i < size and s[i] >= "a" and s[i] <= "z":
                    atom += s[i]
                    i += 1

            # check power after atom [Optional]
            while i < size and s[i] >= "0" and s[i] <= "9":
                power = power * 10 + int(s[i])
                i += 1

            if len(atom) != 0:
                if power == 0:
                    decoded[atom] = decoded.get(atom, 0) + 1
                else:
                    decoded[atom] = decoded.get(atom, 0) + power

            power = 0
            atom = ""

            if i < size and s[i] == "(":
                smaller_decoded: dict[str, int] = dict()

                smaller_decoded, i = self.decode_atoms_helper(i + 1, s)

                power = 0
                # check num after closing bracket
                while i < size and s[i] >= "0" and s[i] <= "9":
                    power = power * 10 + int(s[i])
                    i += 1

                if power == 0:
                    power = 1

                for key, value in smaller_decoded.items():
                    decoded[key] = decoded.get(key, 0) + value * power

            if i < size and s[i] == ")":
                return decoded, i + 1

        return decoded, i
