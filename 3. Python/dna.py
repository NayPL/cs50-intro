import csv
import sys


def main():

    # Check for command-line usage
    if len(sys.argv) != 3:
        print("Wrong command-line usage")
        sys.exit(1)
    else:
        csv_file = sys.argv[1]
        txt_file = sys.argv[2]


    # Read database file into a variable

    with open(csv_file, "r") as file:
        read_csv = csv.reader(file)
        list_csv = list(read_csv)

    # Read DNA sequence file into a variable
    with open(txt_file, "r") as text:
        read_txt = text.read()

    # Find longest match of each STR in DNA sequence

    dna_matches = []
    for i in range(1, len(list_csv[0])):
        dna_matches.append(longest_match(read_txt, list_csv[0][i]))

    # Check database for matching profiles
    match = 0
    dna_name = "No match"
    for i in range(1, len(list_csv)):
        for j in range(len(dna_matches)):
            if int(dna_matches[j]) == int(list_csv[i][j + 1]):
                match += 1
        if match == len(dna_matches):
            dna_name = list_csv[i][0]
            break
        else:
            match = 0
    print(dna_name)


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
