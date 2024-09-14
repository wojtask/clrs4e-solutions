import math


def predicate(n: int) -> bool:
    return 8 * n * n < 64 * n * math.log2(n)


n0 = 1
while not predicate(n0):
    n0 += 1
n1 = n0
while predicate(n1):
    n1 += 1
print(n0, "<= n <=", n1 - 1)
