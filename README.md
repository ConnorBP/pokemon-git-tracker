# pokemon-git-tracker
Tracks local github commits and notifes a shared group channel about the changes with a fun random pokemon attachment.

## things we wawnna use for the OS class project:

 - Rust
 - Shell scripts
 - Lambda (maybe)
 - DB
 - Terraform (setup db/lambda infra) (maybe)

## possible ideas:

pokemon git tracker: read local git changes, and fire events that communicate with a lambda which notifies other group members of changes in discord. Have a DB that with a audit table to save events and more tables maybe. Add some GPT to analyze the structure the event text as a discord bot.
