# PwnBox
A lightweight VM for RE (fuzzing, symEx, exploiting etc) and wargaming tasks

## Setting up

Run the following commands to start the PwnBox :

```
$ git clone https://github.com/Corb3nik/PwnBox
$ cd PwnBox
$ vagrant up
```

The server is accessible via `vagrant ssh`
The box also uses the `ubuntu/ubuntu` credentials to login.

## Useful aliases

Use this alias to login easily.

```
alias pwnbox='sshpass -p ubuntu ssh ubuntu@10.13.37.10
-o StrictHostKeychecking=no -o UserKnownHostsFile=/dev/null'
```
