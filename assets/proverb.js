const {chapters} = require('./proverbs.json')
const chapterLength = chapters.length

let randNum=Math.floor(Math.random() * (chapterLength))
const randChapter = chapters[randNum]

const verseLength = randChapter.verses.length
randNum = Math.floor(Math.random()*verseLength)

const randVerse = randChapter.verses[randNum]
console.log(`Proverbs ${randChapter.chapter}:${randVerse.verse} ${randVerse.text}`)
