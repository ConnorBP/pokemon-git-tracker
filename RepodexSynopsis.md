# Repodex Project Creation Synopsis

Repodox is a developer collaboration tool with a fun nerdy twist. Created by [Carlos](https://github.com/heyimcarlos), [Connor](https://github.com/ConnorBP), [Peggy](https://github.com/peggy8337), and [Saaram](https://github.com/SaaramRashidi)

---

![system overview graphic](./assets/graph.png)

Figure A. Repodex initial "napkin concept" flowchart

## Table of Contents

[TOC]

## Scope

> [!NOTE]
>
> _Why this project? What is the purpose?_

**Abstract**

​ We decided to make Repodex to assist with online developer collaboration, as well as to help motivate developers by showing work that is being done in a fun manner. One core focus of the project was also the technologies involved. Our group members wanted to try out something new, while also making something cool which we can actually use in our day to day lives. Since we also wanted to collaborate via Git and Github, we figured "Why not make something that can help us with Github collaboration and also make it fun and nerdy!"; Hence, Repodex was born!

**Tech**

​ For technologies, our group wanted to learn AWS Lambdas, rustlang (or rust), Terraform, Webhooks, and advanced bash option menus. We also wanted to collaborate using Github, so everyone involved learned how to use the git command line and Github to create commits and pull requests. See figure B (below) for an outline of our server design for the Repodex service.

![img](./assets/repodex_1.jpg)

Figure B. Final Repodex Webservice System Context Diagram

![Sequence Diagram](./assets/sequence.png)

Figure C. Final Repodex sequence diagram of program operations

## Algorithm

> [!NOTE]
>
> _Steps followed for completing the project_

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
      Generate ideas: 6: Connor, Carlos, Saaram, Peggy
      Identify Challenges: 5: Carlos, Connor
      Assess Proficiencies: 4: Connor, Carlos, Peggy, Saaram
    section Creation
      Brainstorm concept: 6: Carlos, Connor, Peggy, Saaram
      Determine skill level: 5: Connor, Carlos
      Divide Work: 7: Carlos, Connor, Peggy, Saaram
      Check Proj. scope: 5: Connor
      Finalize Concept: 7: Carlos, Connor
      Develop Repodex: 5: Connor
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
      Determine Expectations: 7: Saaram
      Learn new skills (Programming languages or tools): 7: Saaram, Peggy, Carlos
      Teach Git: 7: Carlos
      Teach rustlang: 7: Connor
      Setup code repository: 7: Connor, Carlos
      Develop Server: 7: Carlos, Connor
      Develop frontend: 6: Peggy, Saaram
      Inspire, Collaborate: 5: Saaram, Carlos
    section Extensions
      Make Presentation: 7: Saaram
      Dynamic Messages: 0: Connor
      Extend compatibility with more services: 5: Carlos
      Integrate themes: 0: Connor
      Poke-evolutions: 0: Connor
      Expand Config: 3: Carlos
      Web App: 0: Carlos
      HTML Page: 0: Connor
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

**Expected Output**

- A tool with a novel concept that is useful to us

- New learned skills (Programming languages or tools: rustlang, git, aws, etc)

- A useful code repository for the tool that we can proudly show on our resume / portfolio.

- Something that inspires us to code, and assists with our collaboration

  ![commit message example](./screenshots/notification-in-channel.png)

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

See output examples provided alongside this document. [(screenshots folder)](https://github.com/ConnorBP/pokemon-git-tracker/screenshots)

![installer menu](./screenshots/setup-discord-webhook.png)
