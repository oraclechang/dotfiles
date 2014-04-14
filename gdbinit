set listsize 40
set print pretty
handle SIGPIPE nostop noprint
handle SIG37 nostop noprint
set trace-commands on
set logging on

define p_
    print $arg0->print_(0)
end

define pp
    print *$arg0
end

define pf
    print (qo_Field*)($arg0)
end

define ppf
    print *((qo_Field*)($arg0))
end
