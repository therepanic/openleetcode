Output demo.gif

Set Shell "bash"
Set Theme "Catppuccin Mocha"
Set Width 1200
Set Height 520
Set FontSize 17
Set Padding 20
Set WindowBar Colorful
Set BorderRadius 12
Set TypingSpeed 40ms
Set CursorBlink true

Hide
Type "rm -rf /tmp/openleetcode-vhs-home"
Enter
Type "mkdir -p /tmp/openleetcode-vhs-home"
Enter
Type "export HOME=/tmp/openleetcode-vhs-home"
Enter
Type "cat > sol.py <<'PY'"
Enter
Type "class Solution:"
Enter
Type "    def twoSum(self, nums: List[int], target: int) -> List[int]:"
Enter
Type "        numMap = {}"
Enter
Type "        n = len(nums)"
Enter
Type ""
Enter
Type "        for i in range(n):"
Enter
Type "            complement = target - nums[i]"
Enter
Type "            if complement in numMap:"
Enter
Type "                return [numMap[complement], i]"
Enter
Type "            #numMap[nums[i]] = i"
Enter
Type ""
Enter
Type "        return []"
Enter
Type "PY"
Enter
Type "clear"
Enter
Show

Type "openleetcode submit ./sol.py --id 1"
Enter
Sleep 250ms

Type "Y"
Enter
Sleep 3250ms

Type "vim +'set number' sol.py"
Enter
Sleep 300ms

Type "/#numMap"
Enter
Sleep 300ms

Type "x"
Sleep 300ms

Type ":wq"
Enter
Sleep 300ms

Type "openleetcode submit ./sol.py --id 1"
Enter
Sleep 1500ms
