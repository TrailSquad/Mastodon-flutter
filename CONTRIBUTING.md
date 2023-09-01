## About this document

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

## Git Branches

To add a new feature or bug fix, first, create a working branch from **main**. Work in that dedicated branch until you complete the functionality and submit a pull request. Do not add more than one feature or fix in a working branch. A branch will typically correspond to one issue in the issue tracker (JIRA).

How to name working branches is explained in the following section.

## Naming

All naming MUST be wrote in English.
This section describes how branches, commits and pull requests MUST be named.

### Working Branches

Our day to day work is mostly about solving issues that are described JIRA. Once you pick a task, you will first assign the issue to yourself. Then you MUST first create a working branch before you start writing any code.

Working branches MUST be named as follows:

- `feature/{issue identifier}-{kebab-case description}`: Simple tasks. Create an PR to `main` or the corresponding `release` branch when finished.

- `feature/{issue identifier}/main`: Complex tasks that require a subdivision in simpler ones. When finished, PR to `main` or the corresponding `release` branch.

- `feature/{issue identifier}/{subtask identifier}-{kebab-case description}`: These are the individual subtasks that compose a complex task (see above). When finished, PR to `feature/{issue identifier}/main`

- `bugfix/{issue identifier}-{kebab-case description}`: Used for bug fixes. PR to `main` or corresponding `release` branch. If the issue does not exist, you MUST create it yourself. Take the time to advice whoever notified the bug, to create issues instead of communicating bugs by other means.

- `experiment/{kebab-case experiment name}`. Never should be merged.

Only one developer MUST work in a working branch, if a task requires more effort, the main task MUST be split into subtasks, and each developer MUST take care of an individual subtask.

### Pull requests

Pull requests MUST reference the issue they are associated with, the issue MUST be the identifier of the sub-task created to reference iOS development. The naming is as follows:

`{issue identifier}: {Human readable description}`

Remember that the PR description MUST be wrote in English.

### Commits

We MUST use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#summary) to create commit messages. More specifically the [commit message with scope](https://www.conventionalcommits.org/en/v1.0.0/#commit-message-with-scope).
The issue identifier MUST be placed in the scope, and the identifier MUST be the most atomic issue: If the issue has a subtask, then the commit MUST have that identifier.

## Pull request workflow, as the creator

### Before commit your changes

TBD

> You will need a [personal access token](https://developers.inditex.com/tools/github/quickstart/index.html#generate-a-personal-access-token) to authenticate and [sign your commit](https://github-cicd.docs.inditex.dev/githubcicd/stable/configuration/sign-commits.html?hl=sign) using your GPG key.

### Before pushing your branch

* Have everything committed. The output of `git status` should be clean.
* Take a look at your commits with `git show` to check that the changes are exactly what you expect.
* Read once again the Jira requirements to make sure that you didn't forget any corner case.
* Ensure that your branch works after the latest `main`. The following command rebases all your commits to start from main:
  * Please note that you **must not** do it if you've already pushed the branch before as that rewrites the history.
  * ```git fetch && git rebase --preserve-merges origin/main```
* Once you've verified that everything is still working, you can `git push` your branch!

### Submitting a Pull Request

When creating a Pull request you SHOULD fill the template following the instructions.

Have in mind that **when you create a Pull Request, you need to have everything tested or at least, defined what is pending to test**. In case the number of different scenarios is too big, a coordination with QA team/Release Manager is needed in order plan when is a good moment to merge. **Your code when merged must be PRODUCTION READY**.

#### Source and target branch 

Using your branch as source and `main` as target or your `feature` branch if is part of a bigger development. 

#### Assigning a Pull Request 

**At least 1 developer of each vertical that is affected by the PR (AKA codeowners) will review the pull request mandatorily**, so ensure this person has the bandwidth to review it to not block yourself. **If the Pull Request has code that applies to other vertical beside yours, its mandatory to add them as reviewers.** Otherwise, unless you need some specific feedback, you can only add people within your own vertical.

*It's recommended to make variations on the pool of people you ask to review your Pull Requests. You would be requiring to check it out as soon as possible.* So plan yourself, ask for small tasks to your Scrum Masters (task should never be bigger than 8sp), and take the time to review Pull Requests when you change your focus.
 
**If you develop a huge Pull Request** (you must keep your Pull Requests as small as possible) **that touches more than your vertical**, or you want people from other vertical to review your work to spread the knowledge / catch some bugs, **add them to the reviewers**. 

**The people assigned as reviewers will have to review it when possible, knowing that reviewing a Pull Request takes priority over other tasks that are not blocking a colleague**, ping them if needed. Be conscious that these people will have to review it, so the more people you add the more people will be "stopped" reviewing it. Other vertical reviewers would need to review it in a timeframe no longer than 24h

### Reviewing a Pull Request

The Pull Request will be either APPROVED or mark as NEEDS WORK to correct some mistakes or make clarifications. Until then, don't do any action other than answering any possible comments, because adding new commits might mess the current testing.

If you are not assigned to reviewing a Pull Request and you would like to take a look, go ahead, feedback is always welcome.

Don't take anything written there as personal. The reviews might seem harsh, but they are in place to avoid bugs, improve the code, and learn together.

If you get NEEDS WORK, answer/correct any of the discussions, push the changes if needed, and comment to the reviewer that the changes were made. This ping-pong might go on until it's finally merged or closed.


## Merge request workflow, as the reviewer

### During the Pull Request review

Communicate to the Pull Request creator, you start reviewing it. Read the Jira, take a look at the code changes commenting on anything you might find wrong, run the app and test the given case and any other that occurs to you. Feel free to ask questions also to learn about the feature or the codebase.

Review the code, documentation and functionality, not the creator. Take into account that they have a different expertise than you, so be as clear as possible and don't assume deep knowledge of dark components.

Once the review is over, if the opened discussions require work mark the Pull Request as NEEDS WORK and ask the Pull Request creator to fix them. If they don't, mark it as APPROVED. Closing a Pull Request should only be done in rare cases and with a good reason.

**Remember**
If the Pull Request has dependencies to other modules (like NUtil):
1. Merge the module's branch
2. Update the main Pull Request with the `master` reference commit before merging. 

### After the Pull Request is merged

Go to the Jira, review that all the fields were properly filled, leave a comment linking the commit where the changes were done or merged, and mark it as resolved. Add `Equipos Zara: QUX` if it needs a review by that team; if unsure, ask the creator.

## Rule of thumb

* **Squash commits is disabled in Github, but you can always squash in your local branch and then do a force push**
  * Activate the squash in Github is prone to accidents, like remove the commit history of a big feature.

* **Never rewrite history in a submodule if you're referencing any of its commits**
  * When a Pull Request in Zara is referencing some commits on NUtil that were squashed, they point to a commit that might not exist in the future. This is because it doesn't belong to any branch. For example, if you point from Zara to NUtil's commit 12345 and then you squash that into a new commit 56789, the reference from Zara would be broken.
