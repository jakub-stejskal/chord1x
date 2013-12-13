chord1x
=======

Wish to be the most simple chordbook out there =) 
As I'm fed up with all those fancy pages full of lame chords or lyrics in shitty order. 


This is also my first real project in rubby after attenging SaaS class on http://www.edx.org


I'll try to make this work with propper BDD and TDD driven development. 


The intention is also to create API along with the page itself so that it's simple to be used
in native mobile app etc. 

The true goal is to make ultimate list of songs me and my friends are playing
be able to generate pdf of it and have your chords always by you on your phone as a backup solution. 


The usage of standards and "modern" web techniques are to be considered during development. 
HTML5 and CSS3 friendly, use opengraph, microformats (if they're still alive), find standardized format
for storing chords etc. Let's the hacking begin. 




Current Tasks
=============

* login - gmail, fb, twitter login .. user accounts
  * pobly start just with email + pass (yes we need it for the next feature)
  * check this: 
    * http://oauth.rubyforge.org/
  * eventually using this: 
    * https://github.com/pelle/oauth-plugin
  * following this tutorial: 
    * http://stakeventures.com/articles/2009/07/21/consuming-oauth-intelligently-in-rails
  * crating account here: 
    * https://dev.twitter.com/docs/auth/oauth/faq and https://dev.twitter.com/apps
  * using these to store tokens privately: 
    * https://github.com/bkeepers/dotenv
    * https://devcenter.heroku.com/articles/config-vars

* songbook - create simple object for users songbook (probably only one per user now..)
  * it will contain references to songs user adds to his songbook

* keyboard controll 
  * In songs list: 
    * j - down
    * k - up
    * Enter - show song
  * In song view: 
    * Ctrl+Enter - edit song
  * In edit view
    * Ctrl+Enter - save edit

* printing
  * first simple by creating CSS style
    * hide all controlls etc
  * by creating TeX representation with macros for chords, tabs, taking care of layout etc
    * read following lines and research, if there isn't some solution already
    * if not: independently create simple tex file that would just print one song (hardcoded)
    * in that file create macros for chords, move as much functionality to separate tex file as possible 
      (inspiration http://petr.olsak.net/ctustyle.html)
    * create template for the previous, "cleaned" file
    * create generator that would fill previous template for each song
    * IDEAS:
      * if song doesn't fit to one page, show as much as you can a for the rest show the first
        line of each part of the song and chords that are played along

* searching - create search through some of the most popular guitar pages
  * add a textbox above list of songs
    * make it search/filterout songs according to what is typed into the box
    * make it search other pages (with "import" button next to it, see next point "migration")
    * the New Song button will create new song. the name of the song will be prefilled with the searched term
    * if a link to a page is entered, and we do support migration from such a page, a new (or existing - already
      migrated) song will be shown, migrated from such a page

* migration - create ability to migrate song from other page for user
  * in userspace, i.e. javascript..?
  * this is case for research

* suggestions - create simple field in users profile where other people can put name or link to a song as suggestion

* taging, relations, semantics...
  * to make use of semantics, consider refactoring with common parent to all objects in the system
  * commn parent would allow adding basic semantic structure
    * relations between object (like: [song1] --isCoverOf--> [song2] i.e. [s2] --hasCover--> [s1])
  * let's think of a way to "free" the structure of the data
    * move to NoSQL database, where type is simply "object"

* object approach
  * as in previous section "tagging, relations, semantics..." we talk about "relations", these should 
    be stored on "objects". 
    * such object should be structure free (like JSON objects), 
    * with "type" attribute specifying their inteded use and expcected structure, 
    * but they can be pretty much anything, 
    * underlying functionality should allow 
      * versioning of object edits, 
      * creating and deleting raw objects, 
      * manual editing their atributes (just like in Futon - CouchDB user interface), 
      * splitting one object into two, 
      * merging two objects into one, 
    * above this functionality, there should be an overlying web application, hiding and enclosing all this under
      easy to use/fancy UI
