au! BufRead,BufNewFile Gemfile setf ruby
au! BufRead,BufNewFile Capfile setf ruby
au! BufRead,BufNewFile Vagrantfile setf ruby
au! BufRead,BufNewFile Guardfile setf ruby
au! BufRead,BufNewFile Cheffile setf ruby
au! BufRead,BufNewFile Berksfile setf ruby
au! BufRead,BufNewFile .pryrc setf ruby
au! BufRead,BufNewFile *.cap setf ruby
au! BufRead,BufNewFile *.md setf markdown
au! BufRead,BufNewFile *.psgi setf perl
au! BufRead,BufNewFile *.sql  setf mysql
au! BufRead,BufNewFile *.ddl setf mysql
au! BufRead,BufNewFile *.tsx setf typescript.tsx
au! BufNewFile,BufRead *.dig set filetype=yaml
au! Syntax yaml setl indentkeys-=<:> indentkeys-=0#

au! BufRead,BufNewFile *.pql call SetPqlOptions()
function SetPqlOptions()
    set filetype=presto
    set syntax=mysql
endfunction
