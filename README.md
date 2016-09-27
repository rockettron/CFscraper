# CFscraper

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/CFscraper`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'CFscraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install CFscraper

## Usage

**You can parse Codeforces's pages**

If you want to parse Gym's Standings then 
```ruby
dom = CFscraper::StandingsGym.new("http://codeforces.com/gym/101090/standings")
dom.to_hash
=> {:people=>[{:place=>1, :participant=>"mgch", :task_count=>10, :penalty=>815}, 
{:place=>2, :participant=>"enot.1.10", :task_count=>9, :penalty=>315} ...
```

If you want to parse Contest's Standings then
```ruby
dom = CFscraper::StandingsContest.new("http://codeforces.com/contest/718/standings")
dom.to_hash
=> {:people=>[{:place=>1, :participant=>"enot.1.10", :score=>2662}, 
 {:place=>2, :participant=>"Egor", :score=>2658}, {:place=>3, :participant=>"KrK", 
 :score=>2627}, ...
```

You can pase Problems statements
```ruby
dom = CFscraper::Problem.new("http://codeforces.com/contest/718/problem/A")
dom.to_hash
=> {:title=>"A. Efim and Strange Grade", :time_limit=>"1 second", 
 :memory_limit=>"256 megabytes", :input_file=>"standard input", 
 :output_file=>"standard output", :statement=>"<p>Efim just received his grade 
 for the last test. He studies in a special school and his grade
 can be equal to any positive decimal fraction. First he got disappointed, ...
```

And you can parse Topics (page with one topic (full) )
```ruby
dom = CFscraper::Topic.new("http://codeforces.com/blog/entry/47369")
dom.to_hash
 => {:id=>47590, :title=>"Please support A2 Online Judge to come back", 
 :author=>"ahmed_aly", :time_create=>"Sep/26/2016 18:28", :content=>"Hello 
 everyone,Several people are asking me when A2 Online Judge is coming back,
 and unfortunately the issue this time might take longer to fix it. 
 This is the server which was hosting the website....
 ```
 
Parse Content 
```ruby
dom = CFscraper::Content.new("http://codeforces.com/")
dom.to_hash
 {:topics=>[{:id=>47590, :title=>"Please support A2 Online Judge to come back", :author=>"ahmed_aly", :time_create=>"Sep/26/2016 18:28", :content=>"Hello everyone,Several people are asking me when A2 Online Judge is coming back, and ... }, {:id=>47479, :title=>"Codeforces Round #373", :author=>"BigBag", :time_create=>"Sep/21/2016 21:24", :content=>"Hi everyone!Codeforces Round #373 (Div. 1 + Div. 2) will take ...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rockettron/CFscraper.

