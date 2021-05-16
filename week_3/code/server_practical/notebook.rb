# code recycled from domain modelling workshop exercise

class Notebook
  def initialize
    @notes = []
  end

  def create
    puts "enter note text: "
    text = gets.chomp
    puts "enter note tag: "
    tag = gets.chomp
    note = { text: text, tag: tag }
    store(note)
  end

  def store(note)
    @notes << note
  end

  def search
    puts "enter search tag: "
    search_tag = gets.chomp
    result = @notes.select{ |note| note[:tag] == search_tag }
    display(result)
  end

  def display(result)
    result.join("/n")
  end
end

