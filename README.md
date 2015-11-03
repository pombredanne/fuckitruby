#fuckitruby

Tired of `NameError` ? Tired of the lack of AI? Tired of ruby-not-being-a-grammar-nazi?

Fuck it, ruby, that's not what I meant!

```ruby
def lala(explicit)
  if exlicit
    do_something_stupid
  else
    explicit
  end
end
```

```bash
/home/penka-was-abducted/lala.rb:2:in `lala': undefined local variable or method `exlicit' for main:Object (NameError)
  from /home/penka-was-abducted/lala.rb:9:in `<main>'
```

ohh

```ruby
require 'fuckitruby'

def lala...
```

```bash
fix in 'lala': 'exlicit' to 
  'explicit' 				[ENTER]    
  other name 				[type it]
  fix explicit to exlicit 	[!] [ENTER]
> # entering
# program rewrites itself and reexecutes properly
```

##faq

* why
  it's fun.

* srsly?
  actually it's a simple gem combining several really cool hacks
  it looks for the local variables in the offending scope using [binding_of_caller](https://gith),
  it uses lewenstein distance to find the most probable fix and it uses [parser](https://) to
  find the exact locations of other uses in the method and to rewrite the source.

* uh
  it's inspired by magnificient [thefuck command](https://github.com/nvbn/thefuck) 

##kk

Copyright (c) 2015 Alexander Ivanov under the MIT License. See LICENSE for further details.







