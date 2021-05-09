class Note
  def initialize(title, body, formatter = NoteFormatter.new)
    @title = title
    @body = body
    @formatter = formatter
  end

  def display
    @formatter.format(self)
  end

  attr_reader :title, :body
end

class NoteFormatter
  def format(note)
    "Title: #{note.title}\n#{note.body}"
  end
end


RSpec.describe Note do
  let (:fake_formatter) { double :formatter, format:"Title: Test\nTest"}
  it 'displays notes' do
    x = Note.new("Test", "Test", fake_formatter)
    expect(x.display).to eq("Title: Test\nTest")
  end
end

RSpec.describe NoteFormatter do
  let (:fake_note) { double :note, title: "Test", body: "Test" }
  it 'formats notes' do
    expect(subject.format(fake_note)).to eq("Title: Test\nTest")
  end
end