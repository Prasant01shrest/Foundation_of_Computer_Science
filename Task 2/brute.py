import itertools

students = ["A", "B", "C", "D"]

friends = [("A", "B")]
cities = {
    "A": "KTM",
    "B": "PKR",
    "C": "KTM",
    "D": "BRT"
}

for arrangement in itertools.permutations(students):
    valid = True

    for i in range(len(arrangement) - 1):
        s1 = arrangement[i]
        s2 = arrangement[i + 1]

        if (s1, s2) in friends or (s2, s1) in friends:
            valid = False

        if cities[s1] == cities[s2]:
            valid = False

    if valid:
        print("Valid seating:", arrangement)
