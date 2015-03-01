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

yesno frontend_module, default: 0
yesno create_git_repo, default: 1

actions:

tree contents
template inplace:"README.md"
template inplace:"package.json"

shell "npm install --save-dev tape"

if $create_git_repo then
	copy optional/gitignore, .gitignore
end

if $frontend_module then
	tree frontend
	shell "npm install --save-dev uglify-js"
	shell "npm install --save-dev spinup"
	if $create_git_repo then
		append_line .gitignore, "build"
	end
end

if $create_git_repo then
	create_git_repo commit: 1
end
