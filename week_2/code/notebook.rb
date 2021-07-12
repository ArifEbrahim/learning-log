class Notebook
  def initialize(note = Note.new)
    @notes = []
    @note = note
  end

  def create
    note = @note.create
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
  end

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