# Foundation of Computer Science
A practical demonstration on **Secure Data Exchange**, **Computational Complexity Problems (P Vs NP Problems)** and **Database Creation/Normalization(1NF, 2NF, 3NF)** with the aim of recreating theoretical knowledge from text-books into practical scenarios reflecting on real-world cases for technical knowledge.

# Project Overview
This repository is designed as a hands-on learning path through foundational computer science topics. It is divided into three major tasks:
1. Secure Data Exchange 
2. Computational Complexity Analysis
3. Database Normalization & SQL
Each task includes scripts, outputs, and documentation to reinforce theory with practical examples.

# Project Structure
```
Foundation_of_Computer_Science/
│
├── Task 1/                # Encoding & Representation
│   ├── ASCII.py           # ASCII encoding demonstration
│   ├── Base64_1.py        # Base64 encoding example
│   ├── Hexadecimal.py     # Hexadecimal conversion
│   ├── url.py             # URL encoding/decoding
│   └── Output.txt         # Sample outputs
│
├── Task 2/                # Algorithms & Problem Solving
│   ├── brute.py           # Brute-force approach
│   ├── heu.py             # Heuristic-based solution
│   └── output.txt         # Results from algorithm runs
│
├── Task 3/                # Database Normalization & SQL
│   ├── Outputs/
│   │   ├── 1NF.txt        # First Normal Form example
│   │   ├── 2NF.txt        # Second Normal Form example
│   │   ├── 3NF.txt        # Third Normal Form example
│   │   ├── Query.sql      # SQL queries
│   │   └── operations.sql # SQL operations
│
└── README.md              # Project documentation
```

# Installation
Repository Cloning:
```
git clone https://github.com/Prasant01shrest/Foundation_of_Computer_Science.git
cd Foundation_of_Computer_Science
```

# Secure Data Exchange
This section explores on the roles on encoding formats such as **Base 64**, **ASCII**, **Hexadecimal**, etc. on the transmission of data in modern communication. It also aims to teach the risk of unencrypted SMTP transmission through **Man-In-The-Attack(MITM)** and to practically teach learner how mail transmission works.

## Learning Outcomes
- Understand how different encoding schemes work.
- Recognize why encoding is essential for communication protocols.
- Gain practical experience with Python’s encoding libraries.

## Code Usage
```
python Task1/Base64.py
python Task1/ASCII.py
python Task1/Hexadecimal.py
python Task1/url.py
```

# Computational Complexity Analysis
This section explores the arithmetic approaches for solving computational problems such as N problems and NP problems with the help of Brute Force Method or Heuristic Method. This section includes python implementations of said methods and its sample output connecting with real-world cases.

## Learning Outcomes
- Compare brute-force vs heuristic approaches.
- Understand trade-offs between accuracy and efficiency.
- Learn how heuristics can reduce computational complexity in practice.

## Code Usage
```
python Task2/brute.py
python Task2/heu.py
```

# Database Normalization & SQL
This final section focuses on normalizing a college club membership management relational database starting from its un-normalized state. This section contains SQL schemas fro 1NF, 2NF and 3NF conversion.

## Learning Outcomes
- Apply normalization principles to reduce redundancy and improve efficiency.
- Understand differences between 1NF, 2NF, and 3NF.
- Gain practical experience writing and executing SQL queries.

## Quick Start

1.**Start MYSQL Docker Container**
```
docker run --name assignment \
  -e MYSQL_ROOT_PASSWORD=root \
  -d -p 3306:3306 \
  mysql:8.0
```

2.***Wait for MYSQL to Initialize***

3.***Execute the demo scripts***
```
docker exec -i assignment mysql -uroot -proot123 task3db < "Task 3/Outputs/operations.sql"
docker exec -i assignment mysql -uroot -proot123 task3db < "Task 3/Outputs/Query.sql"
```

# Acknowledgments
- Inspired by foundational of computer science module teacher Rupak Rajbanshi
- Built to support learners and practitioners in applying theory to practice

