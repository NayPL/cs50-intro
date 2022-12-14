from cs50 import get_string

text = get_string("Text: ")


def get_letters(text):
    letters = 0
    for i in text:
        if i.islower() or i.isupper():
            letters += 1
    return letters

def get_words(text):
    words = 0
    for i in text:
        if i == " ":
            words += 1
    return (words + 1)

def get_sentences(text):
    sentences = 0
    for i in text:
        if i == "." or i == "?" or i == "!":
            sentences += 1
    return sentences

def get_formula(letters, words, sentences):
    L = float(letters) / float(words) * 100.0
    S = float(sentences) / float(words) * 100.0
    formula = 0.0588 * L - 0.296 * S - 15.8
    return round(formula)

letters = get_letters(text)
words = get_words(text)
sentences = get_sentences(text)
grade = get_formula(letters, words, sentences)

if grade >= 16:
    print("Grade 16+")
elif grade < 1:
    print("Before Grade 1")
else:
    print(f"Grade {grade}")
