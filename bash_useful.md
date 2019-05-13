`echo 1 + 1` `echo $((1 + 1))`

##Redirection:

* stdout to file

    `ls -l > ls.txt`
* stderr to file
    
    `wc -l notfile 2> wc.err`
* stdout to stderr
    
    `ls -l 1>&2 ls.txt`
* stderr to stdout
    
    `ls -l 2>&1 ls.txt`

* stderr and stdout to file
    `ls -l &> myfile`

##Control Flow:
```bash
if [[ expr ]]
then
    echo hi
else if [[ expr ]]
then
    echo hi
else
    echo bye
fi
```


`seq 1 100` instead of `{1..100}` Note there are no commas

`*` globs to files and directories ALWAYS

Remember: `0` is `TRUE` (think `return 0;`)

`-f` if FILE exists and is a regular file
`-a` if FILE exists
`-d` if FILE exists and is a directory

####chmod:
    _ _ _
    bit1 bit2 bit3 READ WRITE EXECUTE
    4 2 1
    USER, GROUP, OTHER, ALL (ugoa)

Redirecting stderr/in/out means redirecting to a FILE stream
Therefore something like sed 's/p1/p2/g' < grep asdf myfile.html
does not make sense because i am redirecting stdio to a file that doesn't actually exist.
That's why you get an error like grep: No such file exists

if [ ]
variables not existing are set to "" if referenced
'test' is another way of writing [ ]
thing after if is a UNIX executable command
[[ ]] is better to use (see pocket guide)
cannot $$i in a for loop to get contents of ith input arg in bash
Therefore we use shift instead
    shift takes in an arg which is what cmdline arg to make the new $1. everything shifts over
    it does not change $0 the script name!

Silently conver integers to 0 if need be

$PS1 is the thing before the $ on the input line of terminal.

```bash
$ test 1 -lt 2
# 0 succeeds if command is true
$ test 2 -lt 1
# 1 not a success
```

* `$@` - all words on commandline -- THIS will correctly deal with spaces for iteration: args 1 2 '3 4' gets treated as 3 whereas
    if we tried doing 1 2 '3 4' into $* we would get 4 arguments.
* `$?` exitcode
* `$#` num_args (does not include file name)
* `$0` file name
* `$i` ith arg
* `$*` all args
* `*` all files in current directory
* `!$` uses the input args of the previous command, e.g. `mkdir asdf` then `cd !$`
* `!!` does the previous command
* `$_` holds arg of previous command

Cannot get values from subshell

$ echo $xyz
$ echo ${x}yz
$ echo $x+$y
$ ((n=$x+$y)) # no spacing needed


Best practice is to "${MYVAR}" I think

echo "* x" will not do shell substition of *.
echo "!a" will not suppress the !

-eq for equality! -e is different
stdin is anonymous! wc -c < a.out will not print the filename

brace expansion:
    useful for copying
    cp /a/really/long/path/file.txt{,.bak}
    causes file.txt to get copied to file.txt.bak

    useful for downloading
    wget http://domain.com/book/page{1..5}.html

    for i in {1..100}
    do
        # something
    done

shell globbing:
    */*.txt expands to all files in subdirectories ending in txt
    does not match dir1/file.txt.1
    also does not match anything in the current directory.
    ? is a one character wildcard
    e.g., ls t?.c will list t2.sh
    e.g., ls -l [a-c]* lists a.1 b.1 and c.1
    e.g., ls -l {b*,c*,*est*} lists b.1 c.1 and test1.txt
    see: http://tldp.org/LDP/abs/html/globbingref.html
