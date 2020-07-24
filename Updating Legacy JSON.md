# Updating Legacy JSON

Use the `home` key to get to the top. 

- [Introduction](#introduction)
  + [Tools Required](#tools-required)
  + [Regex](#regex)
  + [What is JSON?](#what-is-json?)
- [Linting](#linting)
- [abstract, ident, and id](#abstract,-ident,-and-id)
- [Weight](#weight)
- [Volume](#volume)
- [Name](#name)
- [Materials](#materials)
- [Pocket Data](#pocket-data)
- [Ammo Type](#ammo-type)
- [Bleeding](#bleeding)
- [barrel_length](#barrel_length)
- [Weight and Volume](#weight-and-volume)
- [copy-from and looks_like](#copy-from-and-looks_like)
- [Artifacts](#artifacts)
- [bullet_resist](#bullet_resist)
- [blueprint](#blueprint)


# Introduction
Welcome to Updating Legacy JSON.md. I created this document due to an extreme lack of resources determining what was obsolete and had to be fixed, and what was current code.  

Before you go any further, I highly recommend you read the [Manual of Style](https://github.com/CleverRaven/Cataclysm-DDA/blob/master/doc/MANUAL_OF_STYLE.md), the [Guide to adding new content to CDDA for first time contributors](https://github.com/CleverRaven/Cataclysm-DDA/wiki/Guide-to-adding-new-content-to-CDDA-for-first-time-contributors), and the [JSON Style Guide](https://github.com/CleverRaven/Cataclysm-DDA/blob/master/doc/JSON_STYLE.md). These three documents will provide the necessary knowledge to get you started with understanding CDDA's JSON code.


## Tools Required
A lot of obsolete and legacy JSON requires the usage of find-and-replace to bring it up to date. To this end, I recommend that you have a text editor with regex capabilities such as [Sublime Text 3](https://www.sublimetext.com/3), [Notepad++](https://notepad-plus-plus.org/), or, as TheGoatGod recommends, [atom](https://atom.io/). I personally find Sublime the easiest to work with, but TheGoatGod advocates atom, and many others prefer Notepad++, so find what works best for you. 

It can also be useful to have a file searcher on hand for looking through large quantities of files, or searching for specific file names. [Grepwin](https://tools.stefankueng.com/grepWin.html) is what I use, and TheGoatGod recommends [Ultrasearch](https://www.jam-software.com/ultrasearch). Again, and I cannot emphasise enough, use whatever works best for you. 

Note: Currently working on a Python Script to remove the need for regex, and make this simpler for everybody involved.

## Regex
Regex, short for regular expressions, is a syntax used in many find-and-replace engines to specify exactly what you want to find and replace. As you'll see later on, it can massively streamline the process of removing obsolete code. In each section below, I include the specific regex necessary for the task, and how to use it, so don't worry if you don't currently know what regex is. (For those of you interested in learning more, [Regex Quickstart Cheatsheet](https://www.rexegg.com/regex-quickstart.html) has the necessary information.).

## What is JSON?
JSON is short for Javascript Object Notation. It is a text format designed to be lightweight and easy for both humans and machines to read and write. JSON is made up of 5 key components: An `array`, an `object`, a `value`, a `number`, and a `string`. 

An `array` is started with `[` and ended with `]`. It is composed of `value`s separated by `,`s. An `object` is started with `{` and ended with `}`. It is, like an array, composed of `value`s separated by `,`s. A `value` is any other JSON component or `true`, `false`, `null`. A `string` is enclosed in `""` and is a sequence of characters (text). A `number` is simply a number. See [Introducing JSON](https://www.json.org/json-en.html) to learn more.


# Linting
Linting is a coding term for formatting to a certain style, and is a very important part of bringing JSON up to date. The simplest way to lint JSON is to paste it into the [JSON formatter](http://dev.narc.ro/cataclysm/format.html), click 'Lint', and then paste the resulting code back into the original file. If it doesn't work, use the debug steps at [JSONLint](https://jsonlint.com/), to check for errors in the code. If it comes up with the error 'Linter currently unavailable', see the [blueprint](#blueprint) section of this document. 

It is also possible to use the JSON formatter that comes with CDDA, see the [JSON Style Guide](https://github.com/CleverRaven/Cataclysm-DDA/blob/master/doc/JSON_STYLE.md) for information on how to use it.


# abstract, ident, and id
`abstract`, `ident`, and `id`, are all identifiers. Almost very JSON `object`, has an identifier and a `type`. 

`ident` is only used in `type: material`, `type: MOD_INFO`, `type: profession`, `type: scenario`, `type: skill_display_type` and `type: skill`. If you see `ident` used anywhere else, immediately replace it with `id`. If you see `id` or `abstract`, used in any of the above `type`'s, immediately replace with `ident`. 

`abstract` can only be used on `type: TOOL`, `type: GENERIC`, `type: GUN`, `type: COMESTIBLE`, `type: BOOK`, `type: AMMO`, `type: PET_ARMOR`, `type: vehicle_part`, `type: BIONIC_ITEM`, `type: ARMOR`, `type: TOOLMOD`, `type: ENGINE`, `type: MONSTER`, `type: uncraft`, and `type: overmap_terrain`. 

`abstract` creates a pseudo-item that only exists to be copied from and is discarded after JSON loading is complete. If you see it used outside of these fields, replace with `ident` or `id` as appropriate. For debugging purposes, preferable to not use `abstract` on types other than `type: overmap_terrain`. It can cause cascading errors that are impossible to find due to lack of item id and presence in the game. 

`id` can (and perhaps should) be used anywhere `abstract` can be. It is also used in a number of extra cases, however, it is unlikely that you will find `id` being used wrong, and thus, the correct way to use it is outside the scope of this guide. 


# Weight
The current JSON standards for weight look like this: 
```JSON
"weight": "100 g",
```
With obsolete JSON looking like this:
```JSON
"weight": 100, 
"weight": "100g" //or this
```
Legacy weight to modern weight is:
```JSON
"weight": 1  =  "weight": "1 g"
"weight": 20  =  "weight": "20 g"
```

Unfortunately, updating weight is not as simple as replacing all weight values with their modern version, as weight is also used to determine the probability of a specific piece of terrain spawning in mapgen. Once you have determined that there are no mapgen files in the designated , open the find-and replace of your chosen text editor, making sure regex is enabled. 

In the find section, paste:
```regex
"weight": ([0-9]+),
```
And in replace, paste:
```regex
"weight": "$1 g",
```


# Volume
The current JSON standards for volume look like this: 
```JSON
"volume": "250 ml",
```
With obsolete JSON looking like this:
```JSON
"volume": 1, 
"volume": "250ml" //or this
```
Legacy volume to modern volume is:
```JSON
"volume": 1  =  "volume": "250 ml"
"volume": 20  =  "volume": "5000 ml"
"volume": "10000 ml"  =  "volume: 10 L"
```

Unfortunately, updating volume is not as simple as replacing all volume values with their modern version, as volume is also used to determine the loudness of sounds. However, this is relatively uncommon, so you can often find those specific files and temporarily move them. To replace, open your chosen editor's find-and-replace section and,

In the find section, paste:
```regex
"volume": 1,
```
In replace, paste:
```regex
"volume": "250 ml"
```
And repeat for every individual volume value. 

Note: There is, in [JSON tools](https://github.com/CleverRaven/Cataclysm-DDA/tree/master/tools/json_tools), a specific file called CDDAUpdateJsonVolume.js that may be relevant to fixing this. 


# Name
For almost all item types as well as `type: vehicle_part`, `name` should be specified as: 
```JSON
"name": { "str": "pair of socks", "str_pl": "pairs of socks" }
``` 
However, in legacy JSON, it is often specified as:
```JSON
"name": "pair of socks",
"name_pl": "pairs of socks"
```
Unfortunately, due to the numerous different uses of the `name` value, it is impossible to regex search the correct values. You must manually replace the values for each file. Good luck!

The process can be sped up by inputting this sequence into the appropriate sections of the find-and-replace tool: 
First, 
Find:
```regex
"name": "([a-z]+)",
```
Replace: 
```regex
"name": { "str": "$1" },
```
Then, 
Find:
```regex
"name_plural": "([a-z]+)",
```
Replace: 
```regex
"str_plural": "$1" 
```
Afterwards, you have to manually join them together. 


# Materials
The material value should be inside an array:
```JSON
"material": [ "plastic" ],
"material": [ "plastic", "steel" ]
```
However, it is often specified instead as:
```JSON
"material": "plastic"
```
This is easily fixed with a simple regex search:
In find: 
```regex
"material": "([a-z]+)"
```
In replace:
```regex
"material": [ "$1" ]
```


# Pocket Data
In [JSON Tools](https://github.com/CleverRaven/Cataclysm-DDA/tree/master/tools/json_tools), there is pocket_mags.py that should b able to handle some of the work.


# Ammo Type
Under `type: GUN` it is possible to specify `ammo`. It should be enclosed in an array. 
Here is what the JSON should look like:
```JSON
"ammo": [ "300blk" ]
```
However, it often looks like:
```JSON
"ammo": "300blk"
```

The regex for this is basically impossible as `type: AMMO` also specifies an `ammo` field, but does not include it in an array. If you manage to exclude all `type: AMMO`, from your search, simply input:
In find: 
```regex
"ammo": "([^\s]+)"
```
In replace:
```regex
"ammo": [ "$1" ]
```


# Bleeding
This is horrible.


# barrel_length
Very recently, the `barrel_length` parameter for guns has been replaced by `barrel_volume`:
```JSON
"barrel_volume": "750 ml"
```
The truly obsolete method looks like this: 
```JSON
"barrel_length": 1
```
While the slightly obsolete looks like this:
```JSON
"barrel_length": "1 ml"
```
I don't currently know the conversion from number to value. 


# copy-from and looks_like
This is a simple type error. It should look like:
```JSON
"copy-from": "example_item"
"looks_like": "example_item"
```
But can be typed: 
```JSON
"copy_from": "example_item"
"looks-like": "example_item"
```

Simple find and replace will suffice for this.

# Artifacts
Artifacts are currently undergoing a massive change. Nothing has changed yet, so this is simply a placeholder section.


# bullet_resist
`bullet_resist` is a new mandatory entry for `type: material`. If a material does not have `bullet_resist`, it will cause the game errors. Fortunately, it is a relatively simple fix - just add in a `bullet_resist` field to the respective material.


# blueprint
If you've been directed here from the linting section, it is because you have the parameter "blueprint": "", when it should be "blueprint": [ " " ], - A blueprint must always be enclosed in an array. Since this doesn't actually effect the game in any way (blueprint is exclusively used in the code), adding it just for linting should be enough. 
