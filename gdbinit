set listsize 40

#add-auto-load-safe-path /cnfs/DEV_TOOL/sapmnt/appl_sw/gcc47-4.7.2_20130108-0.15.45.sap20140516/lib64/gcc/x86_64-suse-linux/4.7/libstdc++.so.6.0.17-gdb.py

#########################
# print http://www.delorie.com/gnu/docs/gdb/gdb_58.html
#########################
set print pretty
#set print address off
#set print array on
set print object
set auto-solib-add 0

handle SIGPIPE nostop noprint
handle SIG37 nostop noprint
#set trace-commands on
#set logging on

define loadhdb
    shar libhdbrskernel
    shar libhdbcsapi
    shar libhdbbasis
    shar libhdbcswrapper.so
    shar libhdbbasement.so
    shar libhdblttbase.so
end

define p_
#set scheduler-locking on
    print $arg0->print_(0)
#set scheduler-locking off
end

define pp
    print *$arg0
end

define plo
    print $arg0->print_logical(0)
end

define ppy
    print $arg0->print_physical(0)
end

define ptrc
    print qo_Tracer::print_($arg0)
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

