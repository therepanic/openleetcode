class Solution:
    def ambiguousCoordinates(self, s: str) -> List[str]:
        s = s[1:-1]  # Remove parentheses

        def get_valid_numbers(num_str):
            """Returns a list of valid decimal/integer representations."""
            res = []
            for i in range(1, len(num_str) + 1):
                left = num_str[:i]
                right = num_str[i:]

                # Blunk-style Constraint Check:
                # 1. No leading zeros unless it's just "0" or "0.xxx"
                if (len(left) > 1 and left.startswith("0")) or (right.endswith("0")):
                    continue

                if not right:  # It's an integer
                    res.append(left)
                else:  # It's a decimal
                    res.append(f"{left}.{right}")
            return res

        final_results = []
        # Split the coordinate 'manifold' into two halves (x, y)
        for i in range(1, len(s)):
            x_options = get_valid_numbers(s[:i])
            y_options = get_valid_numbers(s[i:])

            # Cartesian Product of valid states
            for x in x_options:
                for y in y_options:
                    final_results.append(f"({x}, {y})")

        return final_results
