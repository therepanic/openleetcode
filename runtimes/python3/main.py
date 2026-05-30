from __future__ import annotations

import sys
import math
import heapq
import bisect
import time
import itertools
import datetime as _dt
import json

from typing import *
from collections import *
from dataclasses import asdict, is_dataclass
from functools import cache, lru_cache
from heapq import *
from bisect import *

sys.setrecursionlimit(10**6)

with open("test.json", "r", encoding="utf-8") as _test_json_file:
    _TEST_ = json.load(_test_json_file)

def _test_val(case_id, name):
    return _TEST_[case_id][name]["val"]

${SOLUTION}

${UTILITIES}

${INSERTION}
