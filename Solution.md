Data Science Toolbox – CCS6442 – Solution

1.	Requirement 1
-	I cloned the fastapi-realworld-example-app and created my own empty repository on GitHub.
-	I didn't fork it, because the handout says not to.
-	I renamed the original remote to "upstream" and added my repository as “origin” so everything I push goes to my repository.

In the repository settings I added the professor as a collaborator and disabled GitHub Actions and Dependabot. I created “app/core/user.py” on master, committed it and pushed master. The problem I had is that Dependabot still opened pull requests after my first push, because the project has a “dependabot.yml” file. I closed those pull requests without merging them, deleted the dependabot branches, and removed the file in a separate commit on master. I did this before creating develop, so develop did not have this file. 

2.	Requirements 2-5 
-	I created develop locally and pushed it.
-	In step 3 I edited “user.py” on GitHub, on develop, and replaced the “pass” line with what was given in the assignment - self.username = usrname. 
-	In step 4 I replaced “pass” with “self.bio = the_bio” on my local develop and committed it, without pulling first. 
-	In step 5 I added the first screenshot and committed it.

3.	Requirement 6
-	When I tried to push, GitHub rejected it:
! [rejected]        develop -> develop (non-fast-forward)
error: failed to push some refs to 'https://github.com/AlexandraaMM/aleksandra_mihaylova_CCS6442.git'

Then I ran:
git pull --no-rebase origin develop
and got a conflict in app/core/user.py. The reason was that I changed the same line (pass) once on GitHub and once locally, so Git didn’t know which version to keep. I kept both lines and removed the conflict markers. Then I did git add, git commit and git push, and this time the push went through. I didn’t use force push, because then the commit I made on GitHub in step 3 would just disappear.

How I could have avoided it:
-	If I had pulled before starting the next step, my develop would already have the GitHub commit and there would be nothing to conflict with.
-	I shouldn’t change the same branch in two places at once.
-	It would be better to make changes on a feature branch and bring them into develop with a pull request.


4.	Requirements 7-11

-	What I then did was to create “feature/step-1” from develop and committed an empty “main_runner.py” Then I added the block given in the assignment and committed again, so the history shows two separate commits.
-	For the next step I created “feature/step-2” from develop and added “get_username” and “set_username”.
-	Then I merged feature/step-2 into develop, and then merged develop into feature/step-1, so feature/step-1 had the latest code.

5.	Requirements 12-13

-	“main_runner.py” only existed on feature/step-1, so I created “feature/step-3” from feature/step-1 and added the import and the Maria example.
-	I pushed it and opened pull request #15 to develop.
-	When I opened #15, my invitation to the professor was still pending, so GitHub didn’t let me pick him as a reviewer yet. I added him as soon as he accepted it.

6.	Requirements 14-18

-	I added “get_bio” and “set_bio” on feature/step-1.
-	Then, I created “feature/step-4” on GitHub, from feature/step-3, because that is where “main_runner.py” with Maria was.
-	Then, I added Avery. At first I committed it with another message because I didn’t read the whole point and pushed it. Then I saw that the requirement wants exactly “Some changes”, so I changed the message with git commit --amend and pushed with git push --force-with-lease. I think this was okay at that moment, because there was no pull request yet and nobody else was working on feature/step-4. Later, the pull request was already open, so there I didn’t change the history.
-	I opened pull request #16 and assigned myself.
-	I also left a review comment saying it can't be merged, because "Some changes" doesn't say what was changed.

7.	Requirement 19 - I did what I wrote in the review

-	created a new branch “feature/step-4-second-user” from feature/step-3
-	added only the two Avery lines and committed them with a clear message
-	pushed the branch and opened a new pull request #17 to develop
-	closed #16 with a comment, without merging it

I didn't fix the old commit on the same branch. The pull request was already open, so changing it would mean rewriting history that was already shared. 

8.	Requirement 20 

-	I checked #17 in the Files changed tab and left my review as a comment.
-	Then I merged it with a normal merge commit, so the feature branch is still visible in the history.
-	#17 also had the commits from feature/step-3, so after merging it GitHub marked #15 as merged automatically.

9.	Requirement 21

-	Before the release I merged feature/step-1 into develop. 
-	I created release/1.0.0 from develop. I used a release branch instead of merging develop straight into master, because develop can still get new work while the release is being prepared. On the release branch I can check the version and fix small things before it goes to the customers, and the rest of the work on develop doesn’t get mixed in.
-	I merged it into master with --no-ff, so there is a merge commit that shows exactly when the release happened.
-	I tagged this merge commit as v1.0.0, so this exact version can always be found again.
-	I also merged the release branch back into develop. Git said “Already up to date”, because I didn’t change anything on the release branch. I still did it, because normally any fix made on the release branch has to go back to develop too.
-	At the end I pushed master, develop, the release branch and the tag. I chose 1.0.0 because it is the first version for the customers.

10.	Requirement 22

-	For the new feature I used a feature branch from develop: “feature/step-5”. 
-	It’s not a hotfix, because nothing was broken – it’s a new thing the customers asked for. It also doesn’t belong on a release branch, because release branches are only for preparing a version, not for adding new features.
-	I didn't merge it, because I was still working on it when the bug in production was reported.

11.	Requirement 23
-	“self.username = usrname” was a bug in the released version. Because it was in production, I used a hotfix branch from master, not from develop. If I had done it otherwise the work would have gone together with the fix.
-	What I did was to create “hotfix/1.0.1” from master and changed the line to “username”.
-	I merged it into master and tagged it “v1.0.1”
-	I merged it into develop too, so the next release doesn't bring the bug back.
-	I merged develop into feature/step-5, so the unfinished feature also has the fix.
-	I noticed later that my commit message says “not fixed” instead of “now fixed”. I didn’t change it, because the commit was already pushed, merged into master and develop and tagged as v1.0.1. Changing it would mean force pushing master, which is risky for a branch that is already shared, so I kept the commit as it was and I the reviewr know.