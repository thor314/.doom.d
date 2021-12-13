;;; org_templates.el -*- lexical-binding: t; -*-
(setq org-capture-templates
  '(
     ;; the following two sections might be better served by some
     ;; integration with projectile, but I couldn't find a feature
     ;; implementation, so the following creates an entry in the project
     ;; root directory for creating notes or todos.

     ;; Use this format to create todos in major projects
     ("t" "Notes files in various directories")
     ("te" "Emacs todo" entry (file+headline "~/.emacs.d/todo.org" "Todos")
       "** TODO %u: %? \n" :prepend t)
     ("to" "Org todo" entry (file+headline "~/org/todo.org" "Todos")
       "*** TODO %u: %? \n" :prepend t)

     ;; Use this format to create quicknotes in projects
     ("n" "Notes files in various directories")
     ("ne" "Emacs usage note" entry (file+headline "~/.emacs.d/notes.org" "Notes")
       "* Note from %u: %? :NOTE:\n" :prepend t)
     ("no" "Org usage note" entry (file+headline "~/org/notes.org" "Notes")
       "* Note from %u: %? :NOTE:\n" :prepend t)
     ("na" "Advent of Code note" entry (file+headline "~/py/play/advent/notes.org" "Notes")
       "* Note from %u: %? :NOTE:\n" :prepend t)

     ;; Store todos in file agenda/todo.org
     ("c" "Crypto" entry (file+headline "~/org/agenda/todo.org" "Crypto")
       "* TODO \t %? :CRYPTO:\nAdded: %u" :prepend t)
     ("e" "Emacs" entry (file+headline "~/org/agenda/todo.org" "Emacs")
       "* TODO \t %? :EMACS:\nAdded: %u" :prepend t)
     ("l" "Linux" entry (file+headline "~/org/agenda/todo.org" "Linux")
       "* TODO \t %? :LINUX:\nAdded: %u" :prepend t)
     ("m" "Math" entry (file+headline "~/org/agenda/todo.org" "Math")
       "* TODO \t %? :MATH:\nAdded: %u" :prepend t)
     ("p" "Personal" entry (file+headline "~/org/agenda/todo.org" "Pers")
       "* TODO \t %? :PERS:\nAdded: %u" :prepend t)
     ("r" "Rust" entry (file+headline "~/org/agenda/todo.org" "Rust")
       "* TODO \t %? :RUST:\nAdded: %u" :prepend t)
     ("w" "Write" entry (file+headline "~/org/agenda/todo.org" "Write")
       "* TODO [#B] \t %? :WRITE:\nAdded: %u" )
     ("z" "Misc todo" entry (file+headline "~/org/agenda/todo.org" "Misc")
       "* TODO \t %? :MISC:\nAdded: %u" :prepend t )
     ;; Declare new habits
     ;; issue: can't figure out how to include the ++1x inside the scheduled timestamp
     ("h" "Habits of various intervals")
     ("hw" "Weekly Habit" entry (file+headline "~/org/agenda/habits.org" "Weekly Habits")
       "* TODO \t %? :HABIT:WEEKLY:\nSCHEDULED: %^t ++1w \n:PROPERTIES:\n:STYLE: habit\n:END:\nAdded: %u" :prepend t)
     ("hm" "Monthly Habit" entry (file+headline "~/org/agenda/habits.org" "Monthly Habits")
       "* TODO \t %? :HABIT:MONTHLY:\nSCHEDULED: %^t ++1m\n:PROPERTIES:\n:STYLE: habit\n:END:\nAdded: %u" :prepend t)
     ("hq" "Quarterly Habit" entry (file+headline "~/org/agenda/habits.org" "Quarterly Habits")
       "* TODO \t %? :HABIT:QUARTERLY:\nSCHEDULED: %^t ++3m\n:PROPERTIES:\n:STYLE: habit\n:END:\nAdded: %u" :prepend t)
     ("hy" "Yearly Habit" entry (file+headline "~/org/agenda/habits.org" "Yearly Habits")
       "* TODO \t %? :HABIT:YEARLY:\nSCHEDULED: %^t ++1y\n:PROPERTIES:\n:STYLE: habit\n:END:\nAdded: %u" :prepend t)
     ;; Misc templates
     ("P" "Project idea" entry (file+headline "~/org/agenda/ideas.org" "Projects")
       "* \t %? :IDEA:PROJECT:\nAdded: %u\n" :prepend t)
     ("I" "Idea" entry (file+headline "~/org/agenda/ideas.org" "Ideas")
       "* \t %? :IDEA:\nAdded: %u\n" :prepend t)
     ("W" "Want list" entry (file+headline "~/org/agenda/ideas.org" "Wants")
       "* \t %? :WANT:\nAdded: %u\n" :prepend t)
     ))
  (setq org-roam-capture-templates
    '(
       ("c" "concept" plain "%?" ;; random thoughts, not used much
         :if-new (file+head "concept/%<%Y-%m-%d>-${slug}.org"
                   "#+title: ${title}\n#+filetags: :concept:\n* ")   :unnarrowed t)
       ("a" "article" plain "%?" ;; articles from the internet
         :if-new (file+head "lit/article/%<%Y-%m-%d>-${slug}.org"
                   ":PROPERTIES:
  :ROAM_REFS: %^{reference}
  :END:
  ,#+filetags: :article:\n#+title: ${title}\n* ")
         :unnarrowed t)
       ("b" "book review" plain "%?"
         :if-new (file+head "book/%<%Y-%m-%d>-${slug}.org"
                   ":PROPERTIES:
  :END:
  ,#+filetags: :book:\n#+title: ${slug}\n")
         :unnarrowed t)
       ("P" "Project" plain "%?"
         :if-new (file+head "project/%<%Y-%m-%d>-${slug}.org"
                   ":PROPERTIES:
  :END:
  ,#+filetags: :project:\n#+title: ${slug}\n* Setup\n** Expected duration\n** OKRs \n* Milestone 1 review\n* Postmortem \n** Discussion \n** Links\n** Time taken: \n** Next project: ")
         :unnarrowed t)
       ("p" "paper" plain "%?" ;; papers
         :if-new (file+head "lit/paper/%<%Y-%m-%d>-${slug}.org"
                   ":PROPERTIES:
  :ROAM_REFS: %^{reference}
  :END:
  ,#+filetags: :paper:\n#+title: ${title}\n* ")
         :unnarrowed t)
       ("w" "week review" plain "%?"
         :if-new (file+head "review/week/%<%Y-%m-%d>-week_review.org"
                   "#+title: Week Review %<%Y-%m-%d> \n#+filetags: :week_review:\n* Week In Review\n** Big vibes\n** Concepts\n** Free Write\n** Projects in Review\n** Projects for this Week\n** Theme for Week:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Review of Crypto Finances\n")
         :unnarrowed t)
       ("m" "month review" plain "%?"
         :if-new (file+head "review/month/%<%Y-%m-%d>-month_review.org"
                   "#+title: Month Review %<%Y-%m-%d> \n#+filetags: :month_review:\n* Month In Review\n** Big vibes\n** Concepts\n** Free Write\n** Theme for Month:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Value Review:\n*** Self-love\n*** Placing curiosity above judgement\n*** Creating community\n*** Learning and building\n** Review of Crypto Finances\n")
         :unnarrowed t)
       ("q" "quarter review" plain "%?"
         :if-new (file+head "review/quarter/%<%Y-%m-%d>-quarter_review.org"
                   "#+title: Quarter Review %<%Y-%m-%d> \n#+filetags: :quarter_review:\n* Quarter In Review\n** Big vibes\n** Free Write\n** Theme for Quarter:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Review of Crypto Finances\n\nPeople https://docs.google.com/spreadsheets/d/17u74o6Z5y6o8YGpMzJ4YLM3dF01WkwoUYblAS8wHqoM/edit?usp=drive_web&ouid=115883971599314555687 ")
         :unnarrowed t)
       ("y" "year review" plain "%?"
         :if-new (file+head "review/year/%<%Y-%m-%d>-year_review.org"
                   "#+title: Year Review %<%Y-%m-%d> \n#+filetags: :year_review:\n* Year In Review\n** Big vibes\n** Free Write\n** Theme for Year:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Review of Crypto Finances\n")
         :unnarrowed t)
       ))