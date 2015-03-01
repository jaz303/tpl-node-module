inputs:

prompt module_name, prompt: "Module name", default: $TARGET_NAME
# , filter: | slugify()

prompt description
prompt github_username, default: $.github_username
prompt homepage, default: "http://github.com/{{ $github_username }}/{{ $module_name }}"
prompt license, default: $.preferred_oss_license
prompt author_name, default: $.name
prompt author_email, default: $.email
prompt author_twitter, default: $.twitter_username
prompt author_homepage, default: $.homepage

yesno create_git_repo, default: 1

actions:

tree contents
template inplace:"README.md"
template inplace:"package.json"
shell "npm install --save tape"

if $create_git_repo then
	copy optional/gitignore, .gitignore
	create_git_repo commit: 1
end

if $need_cli then
  copy optional/cli.js, cli.js
end
