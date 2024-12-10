import math


def min_people_two_people_have_same_birthdays(k: int, n: int, p: float) -> bool:
    return k >= (1 + math.sqrt(1 + 8 * n * math.log(1 / p))) / 2


k = 1
while not min_people_two_people_have_same_birthdays(k, n=365, p=0.99):
    k += 1
print("""minimum number of people for which the probability\
that two people have the same birthday\
is at least 0.99:""", k)
