# start bash if interactive -- gets around setting the shell
if ( $?prompt ) then   # test if interactive (script or remote)
    exec bash
endif