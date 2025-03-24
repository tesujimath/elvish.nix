#!/usr/bin/env elvish
#
# use all our packages

# Complete list of packages from [awesome-elvish](https://github.com/elves/awesome-elvish).
#
# Packages whoe repositories have distinguishable names are names after the bare repo.
# Otherwise the owner is used as a prefix.

# Inclusion here does not imply fitness for purpose or even that the packages work.
# If breakage is discovered, packages which aren't fixed in reasonble time are likely to be removed.
#
# modules requiring $edit are commented out here, at least for now.

# packages with recognizable names:

use github.com/tesujimath/bash-env-elvish/bash-env
# use github.com/tesujimath/direlv/direlv
use github.com/href/elvish-gitstatus/gitstatus
use github.com/tesujimath/elvish-tap/tap
use github.com/crinklywrappr/rivendell/fun
use github.com/jkbr-19/sindarin-term/date-elv

# packages with otherwise ambiguous names require owner as a prefix:

use github.com/aca/elvish-bash-completion/bash-completer
# use github.com/gergelyk/elvish-libs/python
use github.com/iandol/elvish-modules/cmds
# use github.com/iwoloschin/elvish-packages/python
use github.com/kolbycrouch/elvish-libs/pure/fun
use github.com/krader1961/elvish-lib/cmd-duration
use github.com/muesli/elvish-libs/git
# use github.com/xiaq/edit.elv/smart-matcher
# use github.com/zzamboni/elvish-completions/builtins
use github.com/zzamboni/elvish-modules/alias
# use github.com/zzamboni/elvish-themes/chain
