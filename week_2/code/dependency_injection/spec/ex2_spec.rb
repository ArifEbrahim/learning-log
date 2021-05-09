class Diary
  attr_reader :entries

  def initialize(entry_class = Entry)
    @entries = []
    @entry_class = entry_class
  end

  def add(title, body)
    @entries << @entry_class.new(title, body)
  end

  def index
    titles = @entries.map do |entry|
      entry.title
    end
    titles.join("\n")
  end
end

class Entry
  attr_reader :title, :body

  def initialize(title, body)
    @title = title
    @body = body
  end
end

RSpec.describe Diary do
  let (:entry_double) { double :entry, title: "Test"}
  let (:entry_class_double) { double :entry_class, new: entry_double }
  subject {described_class.new(entry_class_double)}
  before { subject.add("Test","Test") }

  it "makes an entry" do
    expect(subject.entries).to eq([entry_double])
  end

  it "outputs an entry" do
    expect(subject.index).to eq("Test") 
  end
end
