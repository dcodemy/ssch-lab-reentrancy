# Reentrancy lab

In this lab you are the `hacker` address and your job is to exploit a reeentrancy vulnerability to steal all the funds from the contract. 

> This lab runs using solidity 0.7.x. If you are using a different version of solidity, please select a compatible version.

## Conditions to satisfy

- The `hacker` address has `2 ether` before the attack.
- The `hacker` address has `82 ether` after a successful reentrancy attack.

## Run the lab 

```shell
$ forge test -vvvv
```

## Solution

If you are stuck, you can check the solution using the following commands:

```shell
git checkout solution
git pull
```

> make sure that your previous changes are stashed or committed before running the above commands. You can run `git stash` to stash your changes, or `git commit -am "my changes"` to commit your changes.

Check the files

- `./test/Exploit.t.sol` (forge exploit)
- `./src/Attack.sol` (attacker contract)

Rerun the command `forge test -vvvv` to check if the solution is correct.


