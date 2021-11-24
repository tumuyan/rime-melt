import emoji

print(emoji.emojize('Python is :thumbs_up:'))
print(emoji.emojize('Python is :thumbsup:', use_aliases=True))
print(emoji.demojize('Python is 👍'))
print(emoji.emojize("Python is fun :red_heart:"))
print(emoji.emojize("Python is fun :red_heart:",variant="emoji_type"))
print(len(emoji.EMOJI_UNICODE))
f = open( "emo1.txt", "w", encoding='utf-8')
for k, v in emoji.EMOJI_UNICODE_ENGLISH.items():
    print(v, end=' ',file=f)
f.close()