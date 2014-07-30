set listsize 40
set print pretty
handle SIGPIPE nostop noprint
handle SIG37 nostop noprint
#set trace-commands on
#set logging on

define p_
    print $arg0->print_(0)
end

define pp
    print *$arg0
end

#########################
# relations
#########################
define rs
    p (qo_Select*)$arg0
end

define prs
    p *((qo_Select*)$arg0)
end


define prt
    p *((qo_Table*)$arg0)
end

define prp
    p *((qo_Project*)$arg0)
end

define prg
    p *((qo_GroupBy*)$arg0)
end

define pru
    p *((qo_UnionAll*)$arg0)
end

define prj
    p *((qo_Join*)$arg0)
end

define prl
    p $arg0->left_rel
end

define prr
    p $arg0->right_rel
end


#########################
# predicates
#########################
define ppd
    p *((qo_Disj*)$arg0)
end


define ppcj
    p *((qo_Conj*)$arg0)
end

define ppcp
    p *((qo_Comp*)$arg0)
end


define ppck
    p *((qo_Check*)$arg0)
end





#########################
# expression
#########################
define pl
    p $arg0->left_exp
end

define pr
    p $arg0->right_exp
end

define pec
    p *((qo_Const*)$arg0)
end


define pefd
    p *((qo_Field*)$arg0)
end

define pefc
    p *((qo_Func*)$arg0)
end



#########################
# gdb
#########################
define subpath
    set substitute-path /SSD/chuho/DailyBuild/sys/src /INT$arg0/chuho/git$arg1/sys/src
    show substitute-path
end


define son
    set scheduler-locking on
end


define soff
    set scheduler-locking off
end

