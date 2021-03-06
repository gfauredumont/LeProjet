[![Build Status](https://travis-ci.org/gfauredumont/LeProjet.svg?branch=master)](https://travis-ci.org/gfauredumont/LeProjet)  [![Code Climate](https://codeclimate.com/github/gfauredumont/LeProjet/badges/gpa.svg)](https://codeclimate.com/github/gfauredumont/LeProjet)
 [![Inline docs](http://inch-ci.org/github/gfauredumont/LeProjet.svg?branch=master)](http://inch-ci.org/github/gfauredumont/LeProjet)
 
# LeProjet: Project connector

Concept: gather all project/task manager & other_infos about a project to be able to manage everything at a glance.

Tasks have hierarchy and a task can be "shared" by several parent-tasks (even from different projects).

## Environment & dev

I work on this project as a learning process: I try to find new ways of working better: TDD, CI, DDD and stuff ;)

For now:
- MIT licenced project hosted on GitHub
- Travis CI hooked to repo
- Heroku automatic deploy on CI success
- DDD models implemention (more later)
- some parts are implemented in TDD (project-members for instance)

## First goals:

- Basic schema for later plug of API, then hooks:
- GitHub
- Pivotal Tracker
- Trello
- MeisterTask ?


## Later goals:
- Action_cable for hooks notifications

## Utimate ?!
- Push modifications TOWARD hooks ;)


## Basic schema

### Project
(a user's technical or business project)
- name:string
- descr:string

### Hook_type
(Listing all available hooks connectable to projects)
- name:string
- url:string

### Hook_project_assoc
(Connects Project to repository/dashboard, etc...)
- hook_type_id:integer
- project_id:integer
- url:string  (i.e. GH project repo url)


### Task
("piece of work" to do for one or several projects)

=> Can be generated by a hook_event
- name:string
- descr:string
- type:(Tech/Business/else ?)

### Project_Task_assoc
(Connects a task to one or several projects)
- project_id:integer
- task_id:integer

### Hook_event
(generated by a "Hook_type", can generate Tasks)
- project_id:integer
- hook_type_id:integer
- name:string
- message:string
- url:string
