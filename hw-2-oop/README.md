# Ruby OOP Homework

Hey, dear #Pivorak Students! 🎉

In previous homework you had to implement license key validation method. Hope all of you did it successfully ;)

And now it is time to do our next hometask and try ourselves in using key OOP concepts in programming on Ruby.


Our goal now is to implement Catalog program that helps us to save, manage and review information about our Music and Movie files in our computer.

The main goal is clear, right? So let's go forward and review our requirements in detail!


## Requirements:

1. You need to have basic class `Item` that stores following information about file:
  - `name` - name of file
  - `code` - unique code of file, Integer
  - `category` - category of file
  - `size` - size of file in Kb
2. You need to have class `Movie` that have the same fields as `Item` and also stores additional info:
  - `director`
  - `main_actor`
  - `main_actress`
3. You need to have class `Music` that have the same fields as `Item` and also stores additional info:
  - `singer`
  - `duration` - in seconds

**Note:** name of attributes should be exactly the same as it is in description.

### Example:

As a result you need to have a possibility to manage your catalog of files.

```ruby
music = Music.new(params)

movie = Movie.new(params)

catalog = Catalog.new

# adding items to the catalog
catalog.add(music)
catalog.add(movie)

# removing item by code
catalog.remove(1263)

# showing item by code
catalog.show(1263)
# => Name: 'Some music'
# => Code: 1263
# => Category: :music
# => size: 134 Kb
# => singer: 'Some singer'
# => duration: 195 sec

# listing all items of catalog
catalog.list
# => Name: 'Some music'
# => Code: 1263
# => Category: :music
# => size: 134 Kb
# => singer: 'Some singer'
# => duration: 195 sec
# => ---------------------------------------------
# => Name: 'Some movie'
# => Code: 1264
# => Category: :movie
# => size: 134 Kb
# => Director: 'Some Director'
# => Main Actor: 'Some Main Actor'
# => Main Actress: 'Some Main Actress'
# => ---------------------------------------------
```

## Mandatory Ruby elements to use in your implementation
1. All the structure described in requirements is implemented, all data attributes have exactly the same names.
2. Defined all appropriate methods that allows ojects to interact with one another.
3. **IMPORTANT!** Constructors (initializers) of objects receive parameters as **Hash arguments**
4. Category names should **not** be passed in constructor. You should use **CONSTANTS** to save category names for Movie and Music. Item DOESN'T have to have any category.
  If you call `category` method on `Item` instance, you should receive `NotImplementedError` with message `'For subclasses only!'`
  `Movie` category should equal to `:movie` (type of `Symbol`).
  `Music` category should equal to `:music` (type of `Symbol`).

5. Catalog should have 4 mandatory methods:
  - `def add(item)`
  - `def remove(code)`
  - `def show(code)`
  - `def list`

## Requirements for 1 point

You did everything from mandatory section and following things:
1. For `Music` and `Movie` should have a possibility to `play` it. Use one of `polymorphism mechanisms` explained on lecture to implement this.
**Note:** you shouldn't implement any playing mechanism. There should be just method `play` that will print some message to the Terminal that 'Music is playing...' or 'Movie is playing...' depend on type of `Item`.

2. You should add a possibility to retrieve information about items from the Internet. Since the behaviour is the same for Music and Movie files we could DRY it out using ruby `Module`. Create a `Module` with the method described above and pass some params to it - like `name` and `category`, based on which you can identify the item. After that you need to include that module to classes where you are gonna use it.
**Note:** Again, you shouldn't implement any real mechanism of retrieving item from the Internet. Just a message, for example 'Music is retrieving from the internet by name: "Some music name"' is enough. Also you can (but NOT REQUIRED) use Ruby [sleep](https://apidock.com/ruby/Kernel/sleep) method to simulate that this process takes some time.

## Requirements for 2 points
You did everything from section 'Requirements for 1 point' and also implemented console client that allows us to operate with data:
1) Create items
2) Add/remove item to/from catalog
3) Listing all items from the catalog
4) Showing concrete item
5) Retrieve information about item from the Internet (feature from previous section)
6) Playing item (feature from previous section)


## Assesment criterias:
**-1**  :  GitlabCI is red or home task was not submitted before 12.06 (Wednesday), 6:00 PM (Kyiv time)

**0**   :  GitlabCI is green

**1**   : GitlabCI is green *and* you implemented ALL requirements for 1 point

**2**   : GitlabCI is green *and* you implemented ALL requirements for 1 point and also ALL requirements (or most of them) for 2 points

## Methods and information that might be helpful while doing hometask
1) `super` with parameters and without them
2) `hash.slice(:key1, :key2)` - allows to get from hash only keys with values that you need. (https://ruby-doc.org/core-2.6.3/Hash.html#method-i-slice)
3) Array method `find` or `detect` to find item in list. This was explained on previous lecture 'Ruby Basics'.
4) Array method `delete` to remove item from the list
5) How to raise Exceptions also explained on previous lecture.

**The last thing and the most important.**

You are getting a repository with already created general structure of program.
You need to think how properly to implement inheritance between classes. Which class should be parent and which class should be child one. And which shouldn't have any relation to other one.
Also you need to complete the methods and create appropriate constructors to the classes to make it possible objects to interact with one another as it is described in requirements.

## Good news:
Number of tries is not limited within given period of time: 10.06 (after Ruby OOP lecture ends) till 12.06 (Wednesday), 6:00 PM (Kyiv time). Don't be shy!

To run tests locally:

`bundle install`

`bundle exec rspec`

To run rubocop locally:

`rubocop`
