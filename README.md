## Installation

1. `gem install ndee`
2. Add ```function ndee { `ruby -S ndee $1`; }``` to your .bashrc

## Usage

You can now cd into any of your Apache configured domains:

```sh
> ndee mypage.com
> pwd
/var/www/mypage.com/public

> ndee blog.mypage.com
> pwd
/var/www/mypage.com/blog/some/folder/new/current/public/
```
