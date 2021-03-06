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
    shar libhdbsqloptimizer
    shar libhdbsqloptimizerapi
    shar libhdbrskernel
    shar libhdbcsapi
    shar libhdbbasis
    shar libhdbcswrapper.so
    shar libhdbbasement.so
    shar libhdblttbase.so
    shar libhdbcsmd.so
    shar libhdbcscommon.so
    shar libhdbhex.so
    shar libhdbqohex.so
    shar libhdbcalcengine.so
    shar libhdbsqlpreprocessor.so
    shar libhdbastruleengine.so
    shar libhdbsqlchecker.so
    shar libhdbdatastatistics.so
    shar libids.so
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

define pstr
    print $arg0.c_str()
end

#########################
# relations
#########################
define prl
    p $arg0->left_rel
end

define prr
    p $arg0->right_rel
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


#########################
# python
#########################
python
 
import sys
#sys.path = ['SAPDevelop/HDB/git/gen/dbg/python_runtime/support/Python/lib/python2.6', '/SAPDevelop/HDB/git/sys/src/gdb_python'] + sys.path
sys.path = ['/INT1/chuho/hana0/build/Optimized/gen/python_runtime/support/Python/lib/python2.7', '/INT1/chuho/hana0/gdb_python'] + sys.path
sys.path = ['/INT1/chuho/hana1/build/Optimized/gen/python_runtime/support/Python/lib/python2.7', '/INT1/chuho/hana1/gdb_python'] + sys.path
sys.path = ['/INT2/chuho/hana2/build/Optimized/gen/python_runtime/support/Python/lib/python2.7', '/INT2/chuho/hana2/gdb_python'] + sys.path
sys.path = ['/INT2/chuho/hana3/build/Optimized/gen/python_runtime/support/Python/lib/python2.7', '/INT2/chuho/hana3/gdb_python'] + sys.path
sys.path = ['/iodrive/chuho/hana4/build/Optimized/gen/python_runtime/support/Python/lib/python2.7', '/iodrive/chuho/hana4/gdb_python'] + sys.path
sys.path = ['/iodrive/chuho/hana5/build/Optimized/gen/python_runtime/support/Python/lib/python2.7', '/iodrive/chuho/hana5/gdb_python'] + sys.path
sys.path = ['/usr/lib64/python', '/usr/lib64/python/lib-dynload'] + sys.path

import os
import encodings
 
# sys.path.insert(0, os.environ["SRC"] + '/gdb_python')
import PrettyPrinters

try:
    import GTestSupport
except:
    pass # some features only supported in new gdb versions

end
