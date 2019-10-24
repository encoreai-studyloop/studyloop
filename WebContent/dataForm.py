from konlpy.tag import Kkma, Hannanum, Komoran, Mecab, Okt
import sys
kkma = Kkma()
okt = Okt()
hannum = Hannanum()
komoran = Komoran()

def nlpCal(sentence):
    res = okt.pos(sentence)
    score = 0
    for i in res:
        if(i[1] == 'Noun'):
            score+=0.5
    print(score)
    return score

nlpCal(sys.argv[1])
