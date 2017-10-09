
##7 infinite monkey problem - this is lit
##how long will it take for a random generator to generate
##"methinks it is like a weasel"
##generatorOne which generates a random string of length n
import random
def generatorOne(n):
    alphabet="abcdefghijklmnopqrstuvwxyz "
    string=""
    for i in list(range(n)):
        string=string+alphabet[random.randrange(len(alphabet))]
    return string

string1=generatorOne(8)
print(string1)

##score function calculates the percentage of characters that matches
##the target
def score(target, string):
    numSame=0
    for i in list(range(len(target))):
        if target[i]==string[i]:
            numSame=numSame+1
    return float(numSame)/float(len(target))

print(score("a weasel", string1))

##put together in a while loop
def main():
    target = "a weasel"
    newstring = generatorOne(8)
    best = 0
    newscore = score(target, newstring)
    while newscore < 1:
          if newscore >= best:
              print(newscore, newstring)
              best = newscore
          newstring = generatorOne(8)
          newscore = score(target, newstring)
main()
