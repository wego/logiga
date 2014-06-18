Logiga
======

Logiga helps you manage multiple loggers.
It is simple and easy to use as each logger is simply an instance of [Logger](http://ruby-doc.org/stdlib-2.1.1/libdoc/logger/rdoc/Logger.html).

Logiga also provides several basic logger such as `PlainFileLogger`, `JsonFileLogger` and `NoopLogger`.

Usage
=====

Call `Logiga.init` and call `register` to add your loggers like this:

```ruby
Logiga.init do |logiga|
  folder = 'log'
  logger1 = ::Logiga::JsonFileLogger.new(File.join(folder, 'file1.log'))
  logiga.register(:one, logger1)
  logger2 = ::Logiga::JsonFileLogger.new(File.join(folder, 'file2.log'))
  logiga.register(:two, logger2)
end
```

You can then retrieve and log as follows:
```ruby
Logiga.for(:one).info("Hello!")
```
