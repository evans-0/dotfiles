# ------------- PS1 config ----------------
# \h or \H -> hostname
# \d -> date (day month date)
# \j -> 0
# \l -> ttys num
# \s -> shell name
# \t -> time (hh:mm:ss)(24 hours)
# \u -> user
# \v -> shell version (x.x.x)
# \w -> current working directory (path)
# \A -> time (hh:mm)
# \T -> time (hh:mm:ss) (12 hours)
# \V -> shell version (x.x.x)
# \W -> current working directory name

esc="\e"
red=$(($RANDOM%256))
green=$(($RANDOM%256))
blue=$(($RANDOM%256))
color="${esc}[38;2;${red};${green};${blue}m" # RGB text color escape sequence
reset="${esc}[0m"	# Reset font format 
export PS1="\[${esc}[91m\]\u\[${reset}\]@\[${color}\]\W\[${reset}\] $ "

# !!! NOTE !!!
# Surround non-printing characters by \[ and \] to avoid breaking line wrapping in bash
