# Repodex Project Creation Synopsis

Repodox is a developer collaboration tool with a fun nerdy twist.

------

![system overview graphic](./assets/graph.png)

Figure A. Repodex initial "napkin concept" flowchart

## Table of Contents

[TOC]

## Scope

> [!NOTE]
>
> *Why this project? What is the purpose?*

​	We decided to make Repodex to assist with online developer collaboration, as well as to help motivate developers by showing work that is being done in a fun manner. One core focus of the project was also the technologies involved. Our group members wanted to try out something new, while also making something cool which we can actually use in our day to day lives.

![img](./assets/repodex_1.jpg)

Figure B. Final Repodex Webservice System Context Diagram

![Sequence Diagram](./assets/sequence.png)

Figure C. Final Repodex sequence diagram of program operations

## Algorithm

> [!NOTE]
>
> *Steps followed for completing the project*

When brainstorming ideas to create this project, this is the process that we followed to end up with our Repodex product:

```mermaid
%%{init: {'theme': 'forest'}}%%
sequenceDiagram
    participant Brainstorming as "Brainstorming"
    participant Creation as "Creation"
    participant Develop_Project as "Develop Project"
    participant Extensions as "Extensions"

    Brainstorming->>Creation: Generated ideas and identified problems
    Creation->>Brainstorming: Assessed technologies
    Brainstorming->>Creation: Brainstormed project concept
    Creation->>Creation: Determined if skill can be taught
    Creation->>Creation: Verified divisibility among group
    Creation->>Creation: Checked if project scope is manageable and extensible
    Creation->>Develop_Project: Finalized project concept and developed Repodex product
    Develop_Project->>Creation: Described expected outputs
    Develop_Project->>Develop_Project: Created tool with a novel concept
    Develop_Project->>Develop_Project: Learned new skills (Programming languages or tools)
    Develop_Project->>Develop_Project: Built a useful code repository
    Develop_Project->>Develop_Project: Enhanced inspiration and collaboration
    Develop_Project->>Extensions: Ready for enhancements
    Extensions->>Extensions: Added Dynamic Motivational Messages feature
    Extensions->>Extensions: Extended compatibility with more services
    Extensions->>Extensions: Integrated various themes
    Extensions->>Extensions: Implemented sequence of Poke-evolutions for commits
    Extensions->>Extensions: Expanded user configuration options
    Extensions->>Extensions: Launched webapp control panel
    Extensions->>Extensions: Developed HTML product page

```

Figure D. Project Inception Process

```mermaid
%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%%
journey
    title Project Development Journey
    section Brainstorming
      Generate ideas: 5: Connor, Carlos, Saaram, Peggy
      Identify Challenges: 4: Carlos, Connor
      Assess Proficiencies: 4: Connor, Carlos, Peggy, Saaram
    section Creation
      Brainstorm project concept: 5: Carlos, Connor, Peggy, Saaram
      Determine if skill can be taught: 3: Connor, Carlos
      Verify divisibility among group: 5: Carlos
      Check project scope is manageable: 5: Connor
      Finalize project concept: 5: Carlos
      Develop the Repodex product: 5: Connor
```

```mermaid
%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%%
journey
    title Project Development Journey
    section Develop Project
      Describe expected outputs: 4: Saaram
      Create tool with a novel concept: 5: Peggy
      Learn new skills (Programming languages or tools): 5: Saaram
      Build a useful code repository: 5: Peggy
      Enhance inspiration and collaboration: 5: Saaram
    section Extensions
      Dynamic Messages: 3: Connor
      Extend compatibility with more services: 3: Carlos
      Integrate themes: 3: Connor
      Poke-evolutions: 3: Carlos
      Expand Config: 3: Connor
      Web App: 3: Carlos
      HTML Page: 3: Connor
```



Figure E. Project Development Process

**Inputs**

- Ideas for technologies to learn and use
- Problem area's we wish to solve
- What technologies each of us are proficient with already

**Processing**

- What can we make together that solves one of the problems and satisfies the following:
  - Has a technology we all want to learn, and at least one of us can teach the others
  - Can be divided into parts among the group members
  - Has a project scope which is both manageable, and extensible
- 

**Expected Output**

- A tool with a novel concept that is useful to us
- New learned skills (Programming languages or tools: rustlang, git, aws, etc)
- A useful code repository for the tool that we can proudly show on our resume / portfolio.
- Something that inspires us to code, and assists with our collaboration

## Project Enhancements

- Motivational "message of the day" at bottom of Repodex notification could be set to dynamically pick a different message for each commit
- Compatibility with additional messaging services can be added (Slack, MSTeams, Telegram, Whatsapp)
- Other character types or themes for the alert messages (other game images, anime characters, Dungeons and dragons, etc)
- Add option to send Poke-evolutions in sequence for commits from the same user
- Additional configuration options for users
- A deployed webapp control panel for setting up repositories
- html product page

# Bash Scripts

See attached scripts submission alongside this document.

All scripts are also on the repository on [Github](https://github.com/ConnorBP/pokemon-git-tracker).

- install
  - install-git.sh
  - install-github-cli.sh
- setup
  - setup-discord-webhook.sh
  - setup-git.sh
  - setup-post-commit.sh
  - setup-symlink.sh
- build.sh
- colors.sh
- install.sh
- invoke.sh
- main.sh
- menu.sh
- setup.sh
- watch.sh
- watchdog.sh

# Outputs Received

See output examples provided alongside this document.