#!/usr/bin/env python3

import git
from datetime import datetime, timedelta
def replace_last(value, pattern, new): 
    value = value.rsplit(pattern, 1)[0] + new + value.rsplit(pattern, 1)[1]

def print_author_commits(repo, author_name, author_email, one_month_ago):
    processed_commits = set()

    for branch in repo.branches:
        commits = []
        for commit in repo.iter_commits(branch.name):
            if (
                commit.author.name == author_name
                and commit.author.email == author_email
                and commit.committed_datetime.replace(tzinfo=None) >= one_month_ago
                and commit.hexsha not in processed_commits
            ):
                commits.append(
                    f"  {commit.committed_datetime}: "
                    + commit.message.strip().replace("\n", "\n    ")
                )
                processed_commits.add(commit.hexsha)

        if not commits:
            continue

        print(f"\nBranch: {branch.name}")
        print('\n'.join(commits))

def print_repository_url(repo):
    remote_url = next((remote.url for remote in repo.remotes if remote.name == 'origin'), None)
    if remote_url:
        print(f"\nStored at: {remote_url}")
    else:
        print("\nStored at: No remote URL found")

def print_other_contributors(repo, author_name, author_email, one_month_ago):
    contributors = set()

    for branch in repo.branches:
        for commit in repo.iter_commits(branch.name):
            if (
                commit.committed_datetime.replace(tzinfo=None) >= one_month_ago
                and (commit.author.name != author_name or commit.author.email != author_email)
            ):
                contributors.add((commit.author.name, commit.author.email))

    authors = []
    for author_key in contributors:
        authors.append(f"  {author_key[0]} <{author_key[1]}>")
    if not authors:
        return

    print("\nOther contributors in the last month:")
    print('\n'.join(authors))

def main():
    try:
        repo = git.Repo(search_parent_directories=True)
    except git.InvalidGitRepositoryError:
        print("Repo not found")
        return

    author_name = repo.config_reader().get_value("user", "name")
    author_email = repo.config_reader().get_value("user", "email")
    one_month_ago = datetime.now() - timedelta(days=30)

    print_author_commits(repo, author_name, author_email, one_month_ago)
    print_repository_url(repo)
    print_other_contributors(repo, author_name, author_email, one_month_ago)

if __name__ == "__main__":
    main()
