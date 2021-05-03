require 'library'

describe Library do
  it 'can find a specific book' do
    book = subject.find_book("POODR")
    expect(book[:title]).to eq("POODR")
  end

  it 'can add a new book' do
    subject.add_book({})
    expect(subject.list_books.length).to eq(5)
  end

  it 'can remove a book' do
    subject.remove_book("POODR")
    expect(subject.list_books.length).to eq(3)
  end

  it 'can list all the books on a specific subject' do
    result = subject.all_books_by_subject("Ruby")
    expect(result[0][:subject]).to eq("Ruby")
  end
end
