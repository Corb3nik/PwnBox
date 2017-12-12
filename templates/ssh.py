#!/usr/bin/env python2

from pwn import *

# == How to use ==
# python ssh.py LOCAL
# python ssh.py REMOTE IP=127.0.0.1 USER=challenge PASS=challenge
# python ssh.py REMOTE IP=127.0.0.1 PORT=22 USER=challenge PASS=challenge

settings = {

    # Path to binary
    "binary"        : "/bin/sh",

    # Path to custom libc
    "libc"          : None,

    # Remote path to binary
    "remote_binary" : "/bin/sh"
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

    if settings['libc']:
        binary.libc = ELF(settings['libc'])


    if args['LOCAL']:
        p = process(binary.path)

    if args['REMOTE']:
        if not all([args.IP, args.USER, args.PASS]):
            log.warning("Missing IP/USER/PASS arguments.")
            exit()


        shell = ssh(args.USER, args.IP, port = int(args.PORT) or 22,
                                    password = args.PASS)

        p = shell.process(settings['remote_binary'])

    if not p:
        log.warning("Missing LOCAL/REMOTE argument.")
        exit()

    pause()
    exploit()
