def predicate(n: int) -> bool:
    return 100 * n * n < 2 ** n


n = 1
while not predicate(n):
    n += 1
print("n =", n)
