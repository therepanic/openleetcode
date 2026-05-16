from __future__ import annotations

import sys
import math
import heapq
import bisect
import time
import itertools
import datetime as _dt

from typing import *
from collections import *
from dataclasses import asdict, is_dataclass
from functools import cache, lru_cache
from heapq import *
from bisect import *

sys.setrecursionlimit(10**6)

${SOLUTION}

${UTILITIES}

_start = int(time.time() * 1000)
${CALL_SOLUTION}
_end = int(time.time() * 1000)
print(_end - _start)
