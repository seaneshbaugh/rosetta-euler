# Rosetta Euler

An attempt at a [chrestomathy](http://en.wikipedia.org/wiki/Chrestomathy) of solutions to problems from [Project Euler](http://projecteuler.net/). All included programs print out their result to standard output (when possible and applicable) and exit. In the future each example for each language will include built in tests to validate the result.

## Initial Setup on OSX

Install [Xcode](https://developer.apple.com/xcode/).

Install the Command Line Tools in Xcode (Preferences > Downloads > Install button next to Command Line Tools).

Install [Homebrew](http://brew.sh/).

## Languages

### Algol 68

[Algol 68 Genie](http://jmvdveer.home.xs4all.nl/)

#### Target Version

    $ a68g --version
    Algol 68 Genie 2.7
    Copyright (c) 2013 Marcel van der Veer <algol68g@xs4all.nl>.

    This is free software covered by the GNU General Public License.
    There is ABSOLUTELY NO WARRANTY for Algol 68 Genie;
    not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    Please report bugs to Marcel van der Veer <algol68g@xs4all.nl>.

    Compilation is supported.
    Compilation is supported.
    Parallel-clause is supported.
    Curses is supported.
    Regular expressions are supported.
    TCP/IP is supported.
    GNU libplot is not supported.
    GNU Scientific Library is not supported.
    PostgreSQL is supported.

#### Additional Setup on OSX

Install the `algol68` formula via Homebrew.

    $ brew install algol68

#### Running

    $ a68g 01.a68

### C

[ISO C Working Group](http://www.open-std.org/jtc1/sc22/wg14/)

[Clang](http://clang.llvm.org/)

#### Target Version

    $ clang --version
    Apple LLVM version 4.2 (clang-425.0.28) (based on LLVM 3.2svn)
    Target: x86_64-apple-darwin12.4.0
    Thread model: posix

#### Additional Setup on OSX

None.

#### Building

    $ make 01

#### Running

    $ ./01

### C++

[ISO C++ Working Group](http://www.open-std.org/JTC1/SC22/WG21/)

[Clang](http://clang.llvm.org/)

#### Target Version

    $ clang --version
    Apple LLVM version 4.2 (clang-425.0.28) (based on LLVM 3.2svn)
    Target: x86_64-apple-darwin12.4.0
    Thread model: posix

#### Additional Setup on OSX

None.

#### Building

    $ make 01

#### Running

    $ ./01

### Common Lisp

[GNU CLISP](http://www.clisp.org/)

#### Target Version

    $ clisp --version
    GNU CLISP 2.49 (2010-07-07) (built on - [-.-.-.-])
    Software: GNU C 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
    /usr/bin/llvm-gcc -m64 -w -pipe -march=core2 -msse4 -W -Wswitch -Wcomment -Wpointer-arith -Wimplicit -Wreturn-type -Wmissing-declarations -Wno-sign-compare -Wno-format-nonliteral -O -falign-functions=4 -DUNIX_BINARY_DISTRIB -DENABLE_UNICODE -DDYNAMIC_MODULES -DNO_GETTEXT -I.  -w -pipe -march=core2 -msse4 -L/usr/local/Cellar/readline/6.2.2/lib  -lreadline -lncurses  -liconv -lsigsegv libgnu_cl.a -L/usr/X11/lib -R/usr/X11/lib
    SAFETY=0 HEAPCODES STANDARD_HEAPCODES WIDE_HARD GENERATIONAL_GC SPVW_BLOCKS SPVW_MIXED TRIVIALMAP_MEMORY
    libsigsegv 2.10
    libiconv 1.11
    libreadline 6.2
    Features: (REGEXP SYSCALLS I18N LOOP COMPILER CLOS MOP CLISP ANSI-CL COMMON-LISP LISP=CL INTERPRETER SOCKETS GENERIC-STREAMS LOGICAL-PATHNAMES SCREEN UNICODE BASE-CHAR=CHARACTER WORD-SIZE=64 UNIX MACOS)
    C Modules: (clisp i18n syscalls regexp)
    Installation directory: /usr/local/Cellar/clisp/2.49/lib/clisp-2.49/
    User language: ENGLISH
    Machine: X86_64 (X86_64) - [-.-.-.-]

#### Additional Setup on OSX

Install the `clisp` formula via Homebrew.

    $ brew install clisp

#### Running

    $ clisp 01.lisp

### Clojure

[Clojure](http://clojure.org/)

#### Target Version

    $ clj
    Clojure 1.5.1

#### Additional Setup on OSX

Install the `clojure` formula via Homebrew.

    $ brew install clojure

#### Running

    $ clj 01.clj

### D

[D Programming Language](http://dlang.org/)

#### Version

    $ dmd
    DMD64 D Compiler v2.063.2
    Copyright (c) 1999-2013 by Digital Mars written by Walter Bright
    Documentation: http://dlang.org/

#### Additional Setup on OSX

Install the `dmd` formula via Homebrew.

    $ brew install dmd

#### Building

    $ dmd 01.d

#### Running

    $ ./01

### Elixir

[Elixir](http://elixir-lang.org/)

#### Target Version

    $ elixir --version
    Elixir 0.10.1

#### Additional Setup on OSX

Install the `erlang-r16` formula via Homebrew.

    $ brew install erlang-r16

Install the `elixir` formula via Homebrew.

    $ brew install elixir

#### Running

    $ elixir 01.exs

### Erlang

[Erlang Programming Language](http://www.erlang.org/)

#### Target Version

    $ erl
    Erlang R16B01 (erts-5.10.2) [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

    Eshell V5.10.2  (abort with ^G)

#### Additional Setup on OSX

Install the `erlang-r16` formula via Homebrew.

    $ brew install erlang-r16

#### Running

    $ ./euler.erl

### Go

[The Go Programming Language](http://golang.org/)

#### Target Version

    $ go version
    go version go1.1.1 darwin/amd64

#### Additional Setup on OSX

Install the `go` formula via Homebrew.

    $ brew install go

Create a directory for your `$GOPATH`

    $ mkdir ~/golang

Ensure the following is in your `.bashrc` or `.zshrc`.

    export GOPATH="$HOME/golang"

Either open up a new terminal or run the following:

    $ export GOPATH="$HOME/golang"

#### Running

    $ go run 01.go

### Haskell

[The Haskell Programming Language](http://www.haskell.org/haskellwiki/Haskell)

#### Target Version

    $ ghc --version
    The Glorious Glasgow Haskell Compilation System, version 7.6.3

#### Additional Setup on OSX

Install the `haskell-platform` formula via Homebrew.

    $ brew install haskell-platform

Add `$HOME/.cabal/bin` to your PATH.

Update cabal.

    $ cabal update

Install the `[cabal-dev](http://hackage.haskell.org/package/cabal-dev)` package via cabal.

    $ cabal install cabal-dev

#### Building

    $ cabal-dev install

#### Running

    $ ./cabal-dev/bin/euler

### Java

[Oracle Technology Network for Java Developers](http://www.oracle.com/technetwork/java/index.html)

#### Target Version

    $ java -version
    java version "1.6.0_51"
    Java(TM) SE Runtime Environment (build 1.6.0_51-b11-457-11M4509)
    Java HotSpot(TM) 64-Bit Server VM (build 20.51-b01-457, mixed mode)

#### Additional Setup on OSX

    Most likely none.

#### Building

    $ javac Euler.java

#### Running

    $ java Euler

### JavaScript

[ECMAScript Language Specification](http://www.ecma-international.org/ecma-262/5.1/)
[node.js](http://nodejs.org/)

#### Target Version

    $ node --version
    v0.10.15

#### Additional Setup on OSX

Install the `node` formula via Homebrew.

    $ brew install node

#### Running

    $ node 01.js

### Objective-C

[Mac Developer Library](http://developer.apple.com/library/mac/navigation/)
[Clang](http://clang.llvm.org/)

#### Additional Setup on OSX

None.

#### Target Version

    $ clang --version
    Apple LLVM version 4.2 (clang-425.0.28) (based on LLVM 3.2svn)
    Target: x86_64-apple-darwin12.4.0
    Thread model: posix

#### Building

    $ make 01

#### Running

    $ ./01

### Prolog

[The GNU Prolog web site](http://gprolog.univ-paris1.fr/)

#### Target Version

    $ gplc --version
    Prolog compiler (GNU Prolog) 1.4.4
    By Daniel Diaz
    Copyright (C) 1999-2013 Daniel Diaz

    GNU Prolog comes with ABSOLUTELY NO WARRANTY.
    This is free software; see the source or the file
    named COPYING for copying conditions.

#### Additional Setup on OSX

Install the `gnu-prolog` formula via Homebrew.

    $ brew install gnu-prolog

#### Building

    $ gplc 01.pl

#### Running

    $ ./01

### Python

[Python Programming Language](http://www.python.org/)

#### Target Version

    $ python --version
    Python 2.7.5

#### Additional Setup on OSX

Install the `pyenv` formula via Homebrew.

    $ brew install pyenv

Ensure the following is in your `.bashrc` or `.zshrc`.

    if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

Install Python 2.7.5.

    $ pyenv install 2.7.5

Set the default Python.

    $ pyenv global 2.7.5

#### Running

    $ python 01.py

### Ruby

[Ruby Programming Language](http://www.ruby-lang.org/en/)

#### Target Version

    $ ruby --version
    ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin11.4.2]

#### Additional Setup on OSX

Install [RVM](https://rvm.io/).

    $ curl -L https://get.rvm.io | bash

Ensure the following is in your `.bashrc` or `.zshrc`.

    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

Either open up a new terminal or run the following:

    $ source ~/.rvm/scripts/rvm

Force RVM to use Homebrew for downloading necessary packages.

    $ rvm autolibs homebrew

Install `ruby-2.0.0-p247`.

    $ rvm install ruby-2.0.0-p247

It may be necessary to add `--verify-downloads 1` to the install command.

Set the default Ruby.

    $ rvm --default use ruby-2.0.0-p247

#### Running

    $ ruby 01.rb

### Scala

[The Scala Programming Language](http://www.scala-lang.org/)

#### Target Version

    $ scala -version
    Scala code runner version 2.10.2 -- Copyright 2002-2013, LAMP/EPFL

#### Additional Setup on OSX

Install the `scala` formula via Homebrew.

    $ brew install scala

#### Running

    $ scala 01.scala

### Scheme

[MIT/GNU Scheme](http://www.gnu.org/software/mit-scheme/)

#### Target Version

    $ scheme --version
    MIT/GNU Scheme microcode 15.3
    Copyright (C) 2011 Massachusetts Institute of Technology
    This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

    Image saved on Friday August 2, 2013 at 10:31:03 PM
      Release 9.1.1 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118 || Edwin 3.116

    Moriturus te saluto.

#### Additional Setup on OSX

Install the `mit-scheme` formula via Homebrew.

    $ brew install mit-scheme

#### Running

    $ scheme --load 01.scm
