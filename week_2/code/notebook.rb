class Notebook
  def initialize
    @notes = []
  end

  def create
    note = Note.new.create
    store(note)
  end

  def store(note)
    @notes << note
  end

  def search
    puts "enter search tag: "
    search_tag = gets.chomp
    result = @notes.select{ |note| note[:tag] == search_tag}
    display(result)

  def display(result)
    result.join("/n")
  end
end


class Note
  def create
    puts "enter note text: "
    text = gets.chomp
    puts "enter note tag: "
    tag = gets.chomp
    user_note = { text: text, tag: tag }
  end
end