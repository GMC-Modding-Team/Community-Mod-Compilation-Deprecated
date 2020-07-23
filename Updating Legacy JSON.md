# Updating Legacy JSON

Use the `home` key to get to the top. 

- [Introduction](#introduction)
- [Tools Required](#tools-required)
- [Regex](#regex)
- [What is JSON?](#what-is-json?)
- [Linting](#linting)
- [abstract, ident, and id](#abstract,-ident,-and-id)
- [Weight and Volume](#weight-and-volume)
- [Name](#name)
- [Materials](#materials)
- [Pocket Data](#pocket-data)
- [Ammo Type](#ammo-type)
- [Bleeding](#bleeding)
- [barrel_length](#barrel_length)
- [Weight and Volume](#weight-and-volume)
- [copy-from and looks_like](#copy-from-and-looks_like)

# Introduction
Welcome to the Guide to updating legacy JSON. This is my first time using markdown or writing a guide, so please feel free to point out any errors or issues you see. Before you go any further, I highly reccommend you read the [Manual of Style](https://github.com/CleverRaven/Cataclysm-DDA/blob/master/doc/MANUAL_OF_STYLE.md), the [Guide to adding new content to CDDA for first time contributors](https://github.com/CleverRaven/Cataclysm-DDA/wiki/Guide-to-adding-new-content-to-CDDA-for-first-time-contributors), and the [JSON Style Guide](https://github.com/CleverRaven/Cataclysm-DDA/blob/master/doc/JSON_STYLE.md). I created this guide due to an extreme lack of resources determining what, exactly was outtdated and had to be fixed. 

# Tools Required
A lot of this content requires find and replace, or at least find. To this end, I recommend you have a text editor with regex capabilities such as [Sublime Text 3](https://www.sublimetext.com/3) or [Notepad++](https://notepad-plus-plus.org/). I find Sublime the easiest to work with, but it's entirely your choice. Don't know what Regex is? Check out the section down below. 

# Regex
Regex, short for regular expressions, is a syntax used in find-and-replace to specify what exactly you want to find, or replace. As you'll see later on, it can do many, many things to help you on your way to making your JSON current. Specific uses will get explained in the relevant sections, so, for now, don't worry too much if you don't understand what it is (For those of you interested in learning more, [Regex Quickstart Cheatsheet](https://www.rexegg.com/regex-quickstart.html) has a lot of the necessary information.).

# What is JSON?
JSON is short for Javascript Object Notation. It is a text format designed to be lightweight and easy for both humans and machines to read and write. JSON is made up of 5 key components: An `array`, an `object`, a `value`, a `number`, and a `string`. 

An `array` is started with `[` and ended with `]`. It is composed of `value`s separated by `,`s. An `object` is started with `{` and ended with `}`. It is, like an array, composed of `value`s separated by `,`s. A `value` is any other JSON component or `true`, `false`, `null`. A `string` is enclosed in `""` and is a sequence of characters (text). A `number` is simply a number. See [Introducing JSON](https://www.json.org/json-en.html) to learn more.

# Linting
Linting is a coding term for formatting to a certain style. Linting is a very important part of bringing JSON up to date. See the [JSON Style Guide](https://github.com/CleverRaven/Cataclysm-DDA/blob/master/doc/JSON_STYLE.md) for more information on linting. g

# abstract, ident, and id
`abstract`, `ident`, and `id`, are all identifiers. Almost very JSON `object`, has an identifier and a `type`. 

`ident` is only used in `type: material`, `type: MOD_INFO`, `type: profession`, `type: scenario`, `type: skill_display_type` and `type: skill`. If you see `ident` used anywhere else, immediately replace it with `id`. If you see `id` or `abstract`, used in any of the above `type`'s, immediately replace with `ident`. 

`abstract` can only be used on `type: TOOL`, `type: GENERIC`, `type: GUN`, `type: COMESTIBLE`, `type: BOOK`, `type: AMMO`, `type: PET_ARMOR`, `type: vehicle_part`, `type: BIONIC_ITEM`, `type: ARMOR`, `type: TOOLMOD`, `type: ENGINE`, `type: MONSTER`, `type: uncraft`, and `type: overmap_terrain`. It creates a pseudo-item that only exists to be copied from and is discarded after JSON loading is complete. It can be freely replaced by id. If you see it used outside of these fields, replace with `ident` or `id` as appropriate. 

# Weight and Volume
The current standards for weight and volume look like this: 
```JSON
"weight": "100 g",
"volume": "250 ml"
```
However, it is very, very common for outdated JSON to use this: 
```JSON
"weight": 100,
"volume": 1
```
Or even this: 
```JSON
"weight": "100g"
"volume": "250ml"
```
The conversion rate for weight is 1 = "1 g", and the conversion rate for volume is 1 = "250 ml". It is common practice to convert very large volumes such as "10000 ml" to "10 L". Unfortunately, it is not as simple as replacing all weights and volumes. Weight is also used as a method to determine the probability of mapgen, and volume is used to determine how loud something is. 

The regex to find weight is:
```regex
"weight": ([0-9]+),
```
And the corresponding replace is:
```regex
"weight": "$1 g",
```
Because the volume value is multiplied by 250ml, replacing has to be done manually, however, this is the code to find all obsolete volume values: 
```regex
"volume": ([0-9]+)
```

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
Unfortunately, due to the numerous different uses of the `name` value, it is almost impossible to regex search the correct values. 

The only way is to use: 
```regex
Currently not found xD
```

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
This is easily fixed with a simple search: 
```regex
"material": "([a-z]+)"
```
And replace:
```regex
"material": [ "$1" ]
```

# Pocket Data
Haha, lol, this is a masssive mess.

# Ammo Type
Under `type: gun` it is possible to specify `ammo`. It should be enclosed in an array. 
Here is what the JSON should look like:
```JSON
"ammo": [ "300blk" ]
```
However, it often looks like:
```JSON
"ammo": "300blk"
```

The regex for this is basically impossible as `type: AMMO` also specifies an `ammo` field, but does not include it in an array. 


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

The find and replace for this is easy. Regex is unnecessary. 