# Add the following to ~/.bashrc
# export PYTHONSTARTUP=$HOME/.pythonstartup.py
# http://jbisbee.blogspot.com/2013/07/add-history-and-tab-completion-to.html
# ~/.pythonstartup.py
try:
    # import __main__ as main
    # if hasattr(main, '__file__'):
    #     raise ImportError
    try:
        if __IPYTHON__:
            ### dont import since iPython handles it
            raise ImportError
    except NameError as e:
        pass
    
    
    import readline
    import rlcompleter
    import atexit
    import os # keep this around
    import sys
    
    # add some nice thing
    import numpy as np
    np.set_printoptions(precision=4, suppress=True)
    
    if sys.version_info[0] < 3:
      from pysurvey import util 
    
except (ImportError, NameError) as e:
    print('Error: %s'%e)
    print("Python shell enhancement modules not available.")
else:
    histfile = os.path.join(os.environ["HOME"], ".pythonhistory")
    import rlcompleter
    readline.parse_and_bind("tab: complete")
    # readline.parse_and_bind("bind ^I rl_complete")
    if os.path.isfile(histfile):
        readline.read_history_file(histfile)
    atexit.register(readline.write_history_file, histfile)
    del histfile, readline, rlcompleter, atexit
    print("Python shell history and tab completion are enabled.")
