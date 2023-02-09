### Japanese-Quiz

- To clone: `git clone "https://github.com/japanese-quiz.git"`

---

#### Preview
	
	<img src="https://0x0.st/HrrR.gif" width="600em" height="350em">

---
#### Dependencies:
- **fzf** :
	You can get it [here](https://github.com/junegunn/fzf)

---

#### Script Usage:

- `./quiz.sh 5` 
- The above command will generate a quiz with '5' questions.
- You can replace '5' with any 'number'. It is the number of questions.
- If you just run `./quiz.sh` , it will ask only '1' question.

---

#### About the script:
- It takes a .tsv file and generates a quiz from that.
- It makes use of `fzf` to present options.
- You don't have to manually write options for every word. It will take 3 random choices ,1 answer and shuffle them again.

---

### About branch-1:
- Initial code
- easy to read quiz.sh
- Added files: *n4kanji.tsv , allWords.csv*
- quiz.sh has been modified accordingly.
- I manually add words to allWords.csv that I learn every day ; ~~I do use a script for this step~~

---

