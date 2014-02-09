# Byticus

A simple unfinished text-based adventure game written in Ruby several years ago with a little help from @h3h. It's obviously no longer in development, but feel free to laugh at it, use it as an example, or contribute.

## Installation

    $ gem install byticus

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Changelog for v0.01
* Added a readme file detailing changes
* Added the Player.initialize method, solving the `@health` problem
* Introduced a problem where the player name cannot be asked (due to the method belonging to the player class, which can't be initialized without a name itself)
* Began work on making the game non-linear
* Revamped use of variables (down to only one global variable)
* Reworked the way the game handles health

