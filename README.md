# Rosetta Euler

An attempt at a [chrestomathy](http://en.wikipedia.org/wiki/Chrestomathy) of solutions to problems from [Project Euler](http://projecteuler.net/). All included programs print out their result to standard output (when possible and applicable) and exit. In the future each example for each language will include built in tests to validate the result.

## Initial Setup on OSX

Install [Xcode](https://developer.apple.com/xcode/).

Install the Command Line Tools in Xcode (Preferences > Downloads > Install button next to Command Line Tools).

Install [Homebrew](http://brew.sh/).

## Languages

### Ada

[Libre: Free Software and Open-Source Development with Ada](http://libre.adacore.com/)

#### Target Version

    $ gnat
    GNAT GPL 2013 (20130314)
    Copyright 1996-2013, Free Software Foundation, Inc.

#### Additional Setup on OSX

[Download GNAT GPL](http://libre.adacore.com/download/configurations).

* Next to "Select your platform:" select "x86_64-darwin" and "2013".
* Click "GNAT 2013".
* Check "gnat-gpl-2013-x86_64-apple-darwin12.2.0-bin.tar.gz".
* Click "Download Selected Files".

Go to your Downloads directory.

    $ cd ~/Downloads

Extract the Zip archive.

    $ unzip AdaCore-Download-2013-08-13_1613.zip

Go to the directory containing the gzip archive.

    $ cd x86_64-darwin/2013/gnatgpl

Extract the gzip archive.

    $ tar -xvzf gnat-gpl-2013-x86_64-apple-darwin12.2.0-bin.tar.gz

Run the install script.

    $ ./doinstall

Answer the install script's questions. If you keep pressing enter and answering "Y" it will install GNAT in `/usr/local/gnat`.

Add `/usr/local/gnat/bin` to your $PATH. For example, in your `~/.bashrc` or `~/.zshrc` add:

    export PATH="/usr/local/gnat/bin:$PATH"

Open a new terminal tab/window or reload your `~/.bashrc` or `~/.zshrc`.

Remove the Zip archive and the extracted files.

    $ cd ~/Downloads
    $ rm -rf AdaCore-Download-2013-08-13_1613.zip x86_64-darwin

#### Building

    $ gnatmake euler.adb

#### Running

    $ ./euler

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

    $ a68g 001.a68

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

    $ make 001

#### Running

    $ ./001

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

    $ make 001

#### Running

    $ ./001

### C&#35;

[Visual C&#35; Resources](http://msdn.microsoft.com/en-us/vstudio/hh341490.aspx)

[Mono](http://mono-project.com/)

#### Target Version

    $ mcs --version
    Mono C# compiler version 3.2.1.0

#### Additional Setup on OSX

Download and install the [Mono MDK](http://www.go-mono.com/mono-downloads/download.html).

#### Building

    $ mcs 001.cs

#### Running

    $ mono 001.exe

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

    $ clisp 001.lisp

### Clojure

[Clojure](http://clojure.org/)

#### Target Version

    $ clj
    Clojure 1.5.1

#### Additional Setup on OSX

Install the `clojure` formula via Homebrew.

    $ brew install clojure

#### Running

    $ clj 001.clj

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

    $ dmd 001.d

#### Running

    $ ./001

### Elixir

[Elixir](http://elixir-lang.org/)

#### Target Version

    $ elixir --version
    Elixir 0.10.2

#### Additional Setup on OSX

Install the `erlang-r16` formula via Homebrew.

    $ brew install erlang-r16

Install the `elixir` formula via Homebrew.

    $ brew install elixir

#### Running

    $ elixir 001.exs

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

### Fortran

[IOS/IEC JTC1/SC22/WG5 (Fortran)](http://www.nag.co.uk/sc22wg5/)

[GNU Fortran](http://gcc.gnu.org/fortran/)

#### Target Version

    $ gfortran --version
    GNU Fortran (GCC) 4.8.1
    Copyright (C) 2013 Free Software Foundation, Inc.

    GNU Fortran comes with NO WARRANTY, to the extent permitted by law.
    You may redistribute copies of GNU Fortran
    under the terms of the GNU General Public License.
    For more information about these matters, see the file named COPYING

#### Additional Setup on OSX

Install the `gfortran` formula via Homebrew.

    $ brew install gfortran

#### Building

    $ make 001

#### Running

    $ ./001

### F&#35;

[The F&#35; Software Foundation](http://fsharp.org/)

[Mono](http://mono-project.com/)

#### Target Version

    $ fsharpc
    F# Compiler for F# 3.0 (Open Source Edition)
    Freely distributed under the Apache 2.0 Open Source License

#### Additional Setup on OSX

Download and install the [Mono MDK](http://www.go-mono.com/mono-downloads/download.html).

#### Building

    $ fsharpc 001.fs

#### Running

    $ mono 001.exe

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

    $ go run 001.go

### Groovy

[Groovy](http://groovy.codehaus.org/)

#### Target Version

    $ groovy -v
    Groovy Version: 2.1.6 JVM: 1.6.0_51 Vendor: Apple Inc. OS: Mac OS X

#### Additional Setup on OSX

Install the `groovy` formula via Homebrew.

    $ brew install groovy

#### Running

    $ groovy 001.groovy

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

### Io

[Io](http://iolanguage.org/)

#### Target Version

    $ io --version
    Io Programming Language, v. 20110905

#### Additional Setup on OSX

Io's installer doesn't seem to play nicely with non-system Pythons. If you're using `pyenv` (or anything similar) set the current Python to the OSX system Python.

    $ pyenv global system

Install the `io` formula via Homebrew (the `--use-clang` option might not be necessary).

    $ brew install io --use-clang

Reset your Python.

    $ pyenv global 2.7.5

#### Running

    $ io 001.io

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

    $ node 001.js

### Julia

[The Julia Language](http://julialang.org/)

#### Target Version

    $ julia -v
    julia version 0.2.0

#### Additional Setup on OSX

The following instructions are from the readme at [staticfloat/homebrew-julia](https://github.com/staticfloat/homebrew-julia). Please verify they are the same before proceeding.

Install the `gfortran` formula via Homebrew.

    $ brew install gfortran

Tap the `staticfloat/julia` keg.

    $ brew tap staticfloat/julia

Install the `julia` formula via Homebrew with the.

    $ brew install --HEAD --64bit julia

#### Running

    $ julia 001.jl

### Lua

[The Programming Language Lua](http://www.lua.org/)

#### Target Version

    $ lua -v
    Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio

#### Additional Setup on OSX

Install the `lua` formula via Homebrew.

    $ brew install lua

#### Running

    $ lua 001.lua

### Nimrod

[Nimrod Programming Language](http://nimrod-code.org/)

#### Target Version

    $ /usr/local/Cellar/nimrod/0.9.2/libexec/bin/nimrod --version
    Nimrod Compiler Version 0.9.2 (2013-05-20) [MacOSX: amd64]
    Copyright (c) 2004-2013 by Andreas Rumpf

#### Additional Setup on OSX

Install the `nimrod` formula via Homebrew.

    $ brew install nimrod

Take note of the post install message:

    The compiler will currently fail to find system.nim if called through a
    symlink. To compile nim files, specify the full path to the compiler

#### Building

    $ /usr/local/Cellar/nimrod/0.9.2/libexec/bin/nimrod compile euler

#### Running

    $ ./euler

### Objective-C

[Mac Developer Library](http://developer.apple.com/library/mac/navigation/)

[Clang](http://clang.llvm.org/)

#### Target Version

    $ clang --version
    Apple LLVM version 4.2 (clang-425.0.28) (based on LLVM 3.2svn)
    Target: x86_64-apple-darwin12.4.0
    Thread model: posix

#### Additional Setup on OSX

None.

#### Building

    $ make 001

#### Running

    $ ./001

### OCaml

[OCaml](http://ocaml.org/)

#### Target Version

    $ ocaml -version
    The OCaml toplevel, version 4.00.1

#### Additional Setup on OSX

Install the `ocaml` formula via Homebrew.

    $ brew install ocaml

#### Running

    $ ocaml 001.ml

### Perl

[The Perl Programming Language](http://www.perl.org/)

#### Target Version

    $ perl -v

    This is perl 5, version 12, subversion 4 (v5.12.4) built for darwin-thread-multi-2level
    (with 2 registered patches, see perl -V for more detail)

    Copyright 1987-2010, Larry Wall

    Perl may be copied only under the terms of either the Artistic License or the
    GNU General Public License, which may be found in the Perl 5 source kit.

    Complete documentation for Perl, including FAQ lists, should be found on
    this system using "man perl" or "perldoc perl".  If you have access to the
    Internet, point your browser at http://www.perl.org/, the Perl Home Page.

#### Additional Setup on OSX

None. This is the default version of Perl on OSX 10.8.4.

#### Running

    $ perl 001.pl

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

    $ gplc 001.pro

#### Running

    $ ./001

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

    $ python 001.py

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

    $ ruby 001.rb

### Rust

[The Rust Programming Language](http://www.rust-lang.org/)

#### Target Version

    $ rust --version
    rust 0.7
    host: x86_64-apple-darwin

#### Additional Setup on OSX

Install the `rust` formula via Homebrew.

    $ brew install rust

#### Building

    $ rustc 001.rs

#### Running

    $ ./001

### Scala

[The Scala Programming Language](http://www.scala-lang.org/)

#### Target Version

    $ scala -version
    Scala code runner version 2.10.2 -- Copyright 2002-2013, LAMP/EPFL

#### Additional Setup on OSX

Install the `scala` formula via Homebrew.

    $ brew install scala

#### Running

    $ scala 001.scala

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

    $ scheme --quiet --load 001.scm

### x86-64 Assembly

[OSX Assembly Reference](https://developer.apple.com/library/mac/documentation/DeveloperTools/Reference/Assembler/000-Introduction/introduction.html)

[Clang](http://clang.llvm.org/)

#### Target Version

    $ clang --version
    Apple LLVM version 4.2 (clang-425.0.28) (based on LLVM 3.2svn)
    Target: x86_64-apple-darwin12.4.0
    Thread model: posix

#### Additional Setup on OSX

None.

**Note: By its nature assembly is very architecture specific. The general logic should remain the same across different platforms, but it's entirely possible significant changes might be required depending on your setup.**

#### C to Assembly

The examples of assembly in this project are taken entirely or mostly from Clang's assembly output from the C examples.

    $ clang -S -fno-asynchronous-unwind-tables 01.c

Clang can output either AT&T or Intel assembly, but as far as I can figure it only supports AT&T syntax assembly for input. To see the Intel syntax assembly add `-mllvm --x86-asm-syntax=intel` after the `-S` option.

#### Building

    $ clang 01.s -o 01

#### Running

    $ ./01
