import math


def predicate(a: int) -> bool:
    return math.log(a, 4) < math.log2(7)


a = 1
while predicate(a):
    a += 1
print("a =", a - 1)
