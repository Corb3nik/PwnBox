#!/usr/bin/env python2

from pwn import *

# == How to use ==
# python remote.py LOCAL
# python remote.py REMOTE IP=127.0.0.1 PORT=1337

settings = {

    # Path to binary
    "binary"        : "/bin/sh",

    # Path to custom libc
    "libc"          : None,
}

# Exploit here
def exploit():

    # Available variables
    # p      => Tubes! (http://docs.pwntools.com/en/stable/tubes.html)
    # binary => ELF of binary

    p.interactive()


# Initial setup
if __name__  == "__main__":

    binary = ELF(settings['binary'])
    p = None
    env = None
    if settings['libc']:
        env = { "LD_PRELOAD" : settings['libc'] }


    if args['LOCAL']:
        p = process(binary.path, env=env)

    if args['REMOTE']:
        if not all([args.IP, args.PORT]):
            log.warning("Missing IP/PORT arguments.")
            exit()

        p = remote(args.IP, int(args.PORT))

    if not p:
        log.warning("Missing LOCAL/REMOTE argument.")
        exit()

    pause()
    exploit()
