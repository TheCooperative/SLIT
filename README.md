# SLIT

**Group members:**
Martin Kanestrøm, Christoffer Lislevand, Kristian Øines, Marius Vika, Joakim Meisner and Anders Ekse.

When uploading something you've wrorked on, please make sure you are up to speed with the branch. When a piece of code is to be implemented in the project it will be uploaded to the **develop** brach, and further when a bigger part is finished it can be uploaded to the **master** branch.

- The **master** branch is only for final work.
- The **develop** branch is for joint work.


## Changing Branch
Note that it would be wise to save your progress before changing branch.
 - git checkout (branchname)


## Git add, commit and push
You can ether add files manually by placing them in the folder under the currect branch, or you can use commandline.
- git add (filename)
- git commit -m "Write comment"
- git push origin (branchname)


## Git pull
When a update to the project is made or you're behind on the code, you can use **git pull** to get your branch up to speed. Be sure that you're on the branch you want to copy the code to, this is usually your personal brach. When that's done you have the code, but it's not publiched on your branch. It's only stored localy on your pc, so you can continue working on the code and experiment and late publish it to your branch.
- git pull origin (branchname)


## Committing
When committing follow these guidelines:
- First explain what **action** you made
  - *Update, Add, Remove, Hotfix, Bugfix, Merge Conflict*
- Second the **filename** of the file you changed or the **merge conflict** you fixed
- Then a short **description** of what you did

Example: *git commit -m "Update - README - Added guidelines"*



### Repository by The Cooperative 2017 - IS-202 - UiA
