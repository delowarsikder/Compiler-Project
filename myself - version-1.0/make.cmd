cls
bison -d m.y
flex m.l
gcc lex.yy.c m.tab.c -o app
app
type output.txt