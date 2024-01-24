# High level design overview document
    This is a broad overview of components we expect to see in the RepoDex system.

![system overview graphic](./assets/graph.png)

## Scripts
#### High level overview of scripts in our bash system and what they do
The *RepoDex* script system will have the following components on the user's machine:
- Main menu interface `run.sh`
    - Handles user input for a graphical-style menu that can select options and call the other scripts. Main entry point for the user.
    - optional: Allow this script to pull the latest version of other sub-scripts from a bucket or repository.
    - Some of the menu options include: start (runs the watcher in place), install (installs the watcher daemon for background running), or deploy (deploys lambdas).
    - when calling start or install options the script should prompt the user for a repository directory on the local machine for the script to watch
- Install script `install.sh`
    - installs the watcher script to the local system as a daemon using systemd or similar.
    - once this is run, the script will run in the background until uninstalled
- Uninstall script `uninstall.sh`
    - reverse of install. Removes the daemon if it exists.
    - in the case that we allow multiple different installs to exist this tool should allow the user to select which watcher to remove.
- Daemon script `watchdog.sh`
    - main functional script. This will run on a loop and check the repository directory for what commit hash it is on every few seconds or so. When the commit hash is different than the previus check it will run the lambda task.
    - calls the lambda with curl or similar
    - when calling the lambda it will provide the following information from the repository:
        - `commit-hash`, `commit-message`, `user-name`, `repo-name`, `branch-name`
    - Will also have a systemd config paired with it
- various deployment scripts for deploying lambda web-services

## Lambdas / Connectors
    TODO

## Database Systems
    TODO

## Object Storage
    TODO

## Webhooks
    TODO