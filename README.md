# Naamio

![Codeship Status](https://www.codeship.io/projects/df8daeb0-44f0-0134-496a-460fa3f2896d/status "Codeship Status")

Naamio is the primary web app engine for 
[Omnijar Studio](https://omnijar.studio "Omnijar Studio")
It can be extended with themes and applets to rapidly
produce web apps using TypeScript.

## The Stack

The app has been built in Swift using [Kitura](https://github.com/IBM-Swift/Kitura)
on the server and TypeScript on the client. The reason for this is to
enable consistent and easily-manageable code to be written
in a modern style across tiers, with the TypeScript 
transpilation abstracting the complexities of browser
implementations and Swift providing an easy-to-deploy 
self-maintaining runtime. This is a sacrifice between 
minimising dependencies and simplifying development on
the client.

The front-end uses XHTML 5.1 rather than HTML. This enables
further extensibility of a strict DOM that can be traversed
for syndication by third-parties, and is therefore useable 
as an undocumented API whilst providing no restrictions
or additional requirements on the developer. 

Reactive Extensions (Rx) are used for the reactive UI for 
performance and to ensure the footprint on the browser
is minimal, (especially when compared to React.js).

Pure CSS is used rather than resorted to CSS pre-compilers 
such as LESS or SASS. The lightweight CSS style used in this 
product allows inheritence and versatility, without 
requiring additional dependencies in the build process.
The goal will be to provide a server-side optimisation
of the CSS and image assets at runtime in due course.

The database for the project is RethinkDB, which is a 
document-based database, using JSON as a storage model.
It's fast and scalable, much faster than this project
requires, and requires minimum effort to maintain.
The web pages are written in markdown and are rendered
and cached by the server process.

## The License

The project is NOT open source, but has been licensed with
specific conditions to allow its source to be used for 
educational purposes. Please read 
[the license](./LICENSE.md "the license") for more 
information.
