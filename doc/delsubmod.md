## How to delete/remove a sub-module from a git repo ##

This document shows you the way to remove a sub-module from a git repo. 
Follow the steps please.

1. Delete the relevant section from the .gitmodules file.  The section would look similar to:

    [submodule "vendor"]
    path = vendor
    url = git://github.com/some-user/some-repo.git

2. Stage the `.gitmodules` changes via command line using:

    git add .gitmodules

3. Delete the relevant section from .git/config, which will look like:

    [submodule "vendor"]
    url = git://github.com/some-user/some-repo.git

4. Run git rm --cached path/to/submodule .  Don't include a trailing slash -- that will lead to an error.

5. Run rm -rf .git/modules/submodule-name

6. Commit the change:

7. Delete the now untracked submodule files rm -rf path/to/submodule
