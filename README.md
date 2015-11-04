#fuckitruby

[![Build Status](https://travis-ci.org/alehander42/fuckitruby.svg)](https://travis-ci.org/alehander42/fuckitruby)

Tired of `NameError` ? Tired of the lack of AI? Tired of ruby-not-being-a-grammar-nazi?

Fuck it, ruby, that's not what I meant!

![](http://i.imgur.com/590uk39.gif)
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

  it's absolutely worthless, but it's fun.

  it's "a program can self-heal itself on error conditions" little experiment


* srsly?

  well it's not for production use , but it combines several really cool hacks

  it looks for the local variables in the offending scope using [binding_of_caller](https://github.com/banister/binding_of_caller),

  it uses lewenstein distance to find the most probable fix, thanks [hotwater](https://github.com/colinsurprenant/hotwater)

  it uses [parser](https://github.com/whitequark/parser/) to
  find the exact locations of name uses in the method 

  it uses [colorize](https://github.com/fazibear/colorize) to color the output

* it's not totally automatic
  
  it informs you what it's trying to do. it's like "okay, now you're in the operation room. grab a whiskey and survive"
  it can be automated to take the [ENTER] action by default, I am not sure if it makes sense, tho

* uh

  it's inspired by magnificient [thefuck command](https://github.com/nvbn/thefuck) 

## that name sucks

it's an obvious nod to `thefuck` command. 

##kk

Copyright (c) 2015 Alexander Ivanov under the MIT License. See LICENSE for further details.


