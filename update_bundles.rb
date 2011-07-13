#!/usr/bin/env ruby

git_bundles = [
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/tsaleh/vim-supertab.git",
  "git://github.com/tsaleh/vim-tcomment.git",
  "git://github.com/jnwhiteh/vimerl.git",
  "git://github.com/wincent/Command-T.git",
  "git://github.com/jnwhiteh/vim-golang.git",
  "git://github.com/vim-scripts/wombat256.vim.git",
  "git://github.com/vim-scripts/IndexedSearch.git",
  "git://github.com/vim-scripts/Gist.vim.git",
  "git://github.com/bronson/vim-trailing-whitespace.git",
  "git://github.com/vim-scripts/desert.vim.git",
  "git://github.com/vim-scripts/vibrantink.git",
  "git://github.com/vim-scripts/ScrollColors.git",
  "git://github.com/jnwhiteh/LaTeX-Suite-aka-Vim-LaTeX.git",
  "git://github.com/vim-scripts/The-NERD-tree.git",
  "git://github.com/jnwhiteh/taglist.vim.git",
  "git://github.com/xolox/vim-easytags.git",
  "git://github.com/vim-scripts/tagexplorer.vim.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-colors-solarized.git",
]

vim_org_scripts = [
#  ["IndexedSearch", "7062",     "plugin"],
#  ["gist",          "12732",    "plugin"],
]

raw_scripts = [
#  ["wombat256", "http://gist.github.com/akitaonrails/vimfiles/raw/master/colors/wombat256.vim"],
#  ["vim-latex", "http://vim-latex.svn.sourceforge.net/viewvc/vim-latex/trunk/?view=tar"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "  Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end

raw_scripts.each do |name, url|
  puts "  Downloading #{name}"
  local_file = File.join(name, "#{name}.raw")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open(url).read
  end
end

puts "Building Command-T ruby extension"

FileUtils.cd("..")
commandt_dir = File.join(File.dirname(__FILE__), "bundle", "Command-T", "ruby", "command-t")
FileUtils.cd(commandt_dir)
system("ruby extconf.rb ; make")
