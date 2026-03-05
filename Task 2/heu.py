students = ["A", "B", "C", "D"]

friends = [("A","B"), ("B","A")]

cities = {"A":"KTM", "B":"PKR", "C":"KTM", "D":"BRT"}

seating = []

for s in students:
    if not seating:
        seating.append(s)
    else:
        last = seating[-1]
        
        if (last, s) not in friends and cities[last] != cities[s]:
            seating.append(s)

print("Heuristic seating:", seating)
