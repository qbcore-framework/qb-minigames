# qb-minigames

I didn't make these, I'm just converting them from here because I was bored so credit to whoever this is https://www.codingnepalweb.com/best-javascript-games-for-beginners
I plan on doing the rest

## Quiz
```lua
  local success = exports['qb-minigames]:Quiz(
        { question = 'What color is a peach?', answer = 'fivem', options = { 'red', 'yellow', 'orange', 'blue', 'pink' } },
        { question = 'What color is an apple?', answer = 'red', options = { 'red', 'yellow', 'orange', 'blue', 'pink' } },
        { question = 'What color is an orange?', answer = 'orange', options = { 'red', 'yellow', 'orange', 'blue', 'pink' } },
        { question = 'What color is a banana?', answer = 'yellow', options = { 'red', 'yellow', 'orange', 'blue', 'pink' } },
        { question = 'What color is a strawberry?', answer = 'red', options = { 'red', 'yellow', 'orange', 'blue', 'pink' } },
        { question = 'What color is a blueberry?', answer = 'blue', options = { 'red', 'yellow', 'orange', 'blue', 'pink' } },
    }, 3, 15)) <- required amount of correct answers & amount of time they have to answer each question

  if success then print('success') else print('fail') end
```

## Word Guess
```lua
  local success = exports['qb-minigames]:WordGuess('fivem', 'the game modification you are playing on', 5) <- how long they have to guess in seconds
  if success then print('success') else print('fail') end
```

## Word Scramble
```lua
  local success = exports['qb-minigames]:WordScramble('fivem', 'the game modification you are playing on', 30) <- how long they have to unscramble in seconds
  if success then print('success') else print('fail') end
```
