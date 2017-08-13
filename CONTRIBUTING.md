## Reporting bugs

* When reporting a bug:
    * Please ensure that you are using the latest release.
    * Revert any custom modifications to insure they're not the cause.
    * Please include the following information:
        * OS/distribution version
        * Docker version
        * Labels from `docker inspect goofball222/unifi:<tagname>`
        * Details on how to reproduce the trouble, if available

---

## Code Changes

* Make sure you have a [GitHub account](https://github.com/signup/free)
* Submit an issue for your request, assuming one does not already exist.
  * Clearly describe the issue including steps to reproduce when it is a bug.
  * Make sure you fill in the earliest version that you know has the issue.
* Fork the repository on GitHub

## Making Changes

* Create a topic branch from where you want to base your work.
  * This is usually the master branch.
  * Only target release branches if you are certain your fix must be on that
    branch.
  * To quickly create a topic branch based on master; `git checkout -b
    fix/master/my_contribution master`. Please avoid working directly on the
    `master` branch.
* Make commits of logical units.
* Check for unnecessary whitespace with `git diff --check` before committing.
* Make sure your commit messages are in the proper format.

````
    (#1234) Make the example in CONTRIBUTING imperative and concrete

    Without this patch applied the example commit message in the CONTRIBUTING
    document is not a concrete example.  This is a problem because the
    contributor is left to imagine what the commit message should look like
    based on a description rather than an example.  This patch fixes the
    problem by making the example concrete and imperative.

    The first line is a real life imperative statement with a issue number
    from GitHub.  The body describes the behavior without the patch, why 
    this is a problem, and how the patch fixes the problem when applied.
````

* Build and run the container with your proposed changes to insure nothing else
  was accidentally broken.

## Making Trivial Changes

### Documentation

For changes of a trivial nature to comments and documentation, it is not
always necessary to create a new issue. In this case, it is
appropriate to start the first line of a commit with '(doc)' instead of
a ticket number.

````
    (doc) Add documentation commit example to CONTRIBUTING

    There is no example for contributing a documentation commit
    to the Goofball222/UniFi repository. This is a problem because
    the contributor is left to assume how a commit of this nature
    may appear.

    The first line is a real life imperative statement with '(doc)' in
    place of what would have been the ticket number in a
    non-documentation related commit. The body describes the nature of
    the new documentation or comments added.
````

## Submitting Changes

* Push your changes to a topic branch in your fork of the repository.
* Submit a pull request to the repository.
* Maintainers will review and provide feedback on the pull request within two weeks.
* After feedback has been given we expect responses within two weeks. After two
  weeks we may close the pull request if it isn't showing any activity.

## Revert Policy
If the code change results in a failure, we will make our best effort to
correct the error. If a fix cannot be determined and committed within 24 hours
of its discovery, the commit(s) responsible _may_ be reverted, at the
discretion of the committer and maintainers. This action would be taken
to help maintain passing states in the Docker hub builds.

The original contributor will be notified of the revert in the GitHub issue
or pull request associated with the change. A reference to the failure/error
from Docker hub as a result of the code change will also be added to the 
comments.


