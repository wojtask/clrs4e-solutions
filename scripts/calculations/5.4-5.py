import math


def probability_exactly_i_pairs_have_matching_birthdays(i, k, n):
    return math.factorial(k) / n ** k * math.comb(n, i) * math.comb(n - i, k - 2 * i) / 2 ** i


def probability_k_people_have_same_birthday(k, n):
    prob = 1.0
    for i in range(0, k // 2 + 1):
        prob -= probability_exactly_i_pairs_have_matching_birthdays(i, k, n)
    return prob


n = 365
k = 3
while probability_k_people_have_same_birthday(k, n) < 0.5:
    k += 1
print("""minimum number of people for which the probability\
that three people have the same birthday\
is at least 1/2:""", k)
