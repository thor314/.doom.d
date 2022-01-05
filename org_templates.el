;;; org_templates.el -*- lexical-binding: t; -*-
(setq org-capture-templates
  '(
    ("t" "Personal todo" entry
     (file+headline +org-capture-todo-file "Inbox")
     "* %?\n%i\n%a" :prepend t)
    ("n" "Personal notes" entry
     (file+headline +org-capture-notes-file "Inbox")
     "* %u %?\n%i\n%a" :prepend t)
    ("p" "Templates for projects")
    ("pt" "Project-local todo" entry
     (file+headline +org-capture-project-todo-file "Inbox")
     "* TODO %?\n%i\n%a" :prepend t)
    ("pn" "Project-local notes" entry
     (file+headline +org-capture-project-notes-file "Inbox")
     "* %U %?\n%i\n%a" :prepend t)
    ("pc" "Project-local changelog" entry
     (file+headline +org-capture-project-changelog-file "Unreleased")
     "* %U %?\n%i\n%a" :prepend t)
    ("o" "Centralized templates for projects")
    ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
    ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
    ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t)

     ("c" "Crypto" entry (file+headline "~/org/agenda/todo.org" "Crypto")
       "* TODO \t %? :CRYPTO:\nAdded: %u" :prepend t)
     ("e" "Emacs" entry (file+headline "~/org/agenda/todo.org" "Emacs")
       "* TODO \t %? :EMACS:\nAdded: %u" :prepend t)
     ("l" "Linux" entry (file+headline "~/org/agenda/todo.org" "Linux")
       "* TODO \t %? :LINUX:\nAdded: %u" :prepend t)
     ("m" "Math" entry (file+headline "~/org/agenda/todo.org" "Math")
       "* TODO \t %? :MATH:\nAdded: %u" :prepend t)
     ("P" "Personal" entry (file+headline "~/org/agenda/todo.org" "Pers")
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
                   "#+title: Quarter Review %<%Y-%m-%d> \n#+filetags: :quarter_review:\n* Quarter In Review\n** Big vibes\n** Free Write\n** Theme for Quarter:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Review of Crypto Finances\n\n** People")
         :unnarrowed t)
       ("y" "year review" plain "%?"
         :if-new (file+head "review/year/%<%Y-%m-%d>-year_review.org"
                   "#+title: Year Review %<%Y-%m-%d> \n#+filetags: :year_review:\n* Year In Review\n** Big vibes\n** Free Write\n** Theme for Year:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Review of Crypto Finances\n")
         :unnarrowed t)
))
