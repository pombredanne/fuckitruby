#fuckitruby

Tired of `NameError` ? Tired of the lack of AI? Tired of ruby-not-being-a-grammar-nazi?

Fuck it, ruby, that's not what I meant!

![gif showing how fuckitruby works](http://i.imgur.com/590uk39.gifv)
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

##Install

```bash
gem install fuckitruby
```

##faq

* why

  it's fun.

  it's "a program can self-heal itself on error conditions" little experiment


* srsly?

  well it's not for production use , but it combines several really cool hacks

  it looks for the local variables in the offending scope using [binding_of_caller](https://github.com/banister/binding_of_caller),

  it uses lewenstein distance to find the most probable fix, thanks [hotwater](https://github.com/colinsurprenant/hotwater)

  it uses [parser](https://github.com/whitequark/parser/) to
  find the exact locations of name uses in the method 

  it uses [colorize](https://github.com/fazibear/colorize) to color the output

* uh
  it's inspired by magnificient [thefuck command](https://github.com/nvbn/thefuck) 

## that name sucks

it's an obvious nod to `thefuck` command. 

##kk

Copyright (c) 2015 Alexander Ivanov under the MIT License. See LICENSE for further details.


