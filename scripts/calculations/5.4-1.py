import math


def min_people_one_person_has_birthday_same_as_mine(k: int, n: int, p: float) -> bool:
    return k > math.log(p, 1 - 1 / n)


def min_people_two_people_have_birthdays_on_given_day(k: int, n: int, p: float) -> bool:
    return (n - 1) ** (k - 1) * (n - 1 + k) / n ** k <= p


k = 1
while not min_people_one_person_has_birthday_same_as_mine(k, n=365, p=0.5):
    k += 1
print("""minimum number of people for which the probability\
that someone has the same birthday as I do\
is at least 1/2:""", k)

k = 1
while not min_people_two_people_have_birthdays_on_given_day(k, n=365, p=0.5):
    k += 1
print("""minimum number of people for which the probability\
that at least two people have a birthday on July 4\
is greater than 1/2:""", k)
