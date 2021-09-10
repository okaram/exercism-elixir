defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_and_read(attr) do
    IO.puts("What is your character's #{attr}?")
    String.trim(IO.read(:line))
  end

  def ask_name() do
    ask_and_read("name");
  end

  def ask_class() do
    ask_and_read("class");
  end

  def ask_level() do
    {l,rest}=Integer.parse(ask_and_read("level"));
    l
  end

  def run() do
    welcome()
    name=ask_name()
    class=ask_class()
    level=ask_level()
    m=%{class: class, level: level, name: name}
    IO.write("Your character: ")
    IO.inspect(m, label: "Your character")
  end
end
